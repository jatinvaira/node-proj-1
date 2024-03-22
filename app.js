const express = require("express");
const mongoose = require("mongoose");
const session = require("express-session");
const passport = require("passport");
const router = express.Router();
const LocalStrategy = require("passport-local").Strategy;
const bcrypt = require("bcrypt");
const app = express();
const port = 3000;
const crypto = require("crypto");
const bodyParser = require("body-parser");
const path = require("path");
const flash = require("connect-flash");
const timeSlotsRouter = require("./routers/timeSlot");

// const authMiddleware = require('./authMiddleware');
function authenticateDriver(req, res, next) {
  if (req.isAuthenticated() && req.user.userType === "Driver") {
    return next();
  }
  res.redirect("/login");
}

function authenticateAdmin(req, res, next) {
  if (req.isAuthenticated() && req.user.userType === "Admin") {
    return next();
  }
  res.redirect("/login");
}

const secretKey = crypto.randomBytes(32).toString("hex");

// MongoDB connection
const dbUri =
  "mongodb+srv://Sukhveer:sukhveer123@cluster1.p2lhbhl.mongodb.net/?retryWrites=true&w=majority";
mongoose.connect(dbUri, { useNewUrlParser: true, useUnifiedTopology: true });
const db = mongoose.connection;

db.on("error", (err) => {
  console.error("MongoDB connection error:", err);
});

db.once("open", () => {
  console.log("Connected to MongoDB");
});
const Appointment = mongoose.model(
  "Appointment",
  new mongoose.Schema({
    date: String,
    time: String,
    isTimeSlotAvailable: Boolean,
  })
);

const User = mongoose.model(
  "User",
  new mongoose.Schema({
    username: String,
    password: String,
    userType: {
      type: String,
      enum: ["Driver", "Examiner", "Admin"],
      default: "Driver",
    },
    firstname: { type: String, default: "default" },
    lastname: { type: String, default: "default" },
    licenseNo: { type: String, default: "default" },
    age: { type: Number, default: 0 },
    car_details: {
      make: { type: String, default: "default" },
      model: { type: String, default: "default" },
      year: { type: String, default: "0" },
      platno: { type: String, default: "default" },
    },
  })
);

// Express app setup
app.set("view engine", "ejs");
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Static files (CSS, JS, images, etc.)
app.use(express.static(path.join(__dirname, "public")));
app.use(
  express.static(path.join(__dirname, "public"), {
    extensions: ["html", "htm", "js", "css"],
  })
);

app.use(
  session({
    secret: secretKey,

    resave: true,
    saveUninitialized: true,
  })
);

app.use(passport.initialize());
app.use(passport.session());

app.use(flash());

// Express session and passport setup

passport.use(
  new LocalStrategy((username, password, done) => {
    User.findOne({ username: username })
      .then((user) => {
        if (!user) {
          return done(null, false, { message: "Incorrect username" });
        }
        bcrypt
          .compare(password, user.password)
          .then((isMatch) => {
            if (isMatch) {
              console.log("done");
              return done(null, user);
            } else {
              console.log("passwrong");
              return done(null, false, { message: "Incorrect password" });
            }
          })
          .catch((err) => done(err));
      })
      .catch((err) => done(err));
  })
);

passport.serializeUser((user, done) => {
  done(null, user.id);
});
passport.deserializeUser((id, done) => {
  User.findById(id)
    .then((user) => done(null, user))
    .catch((err) => done(err));
});

// Middlewares
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(express.static(__dirname + "/public"));

// Routes
app.get("/logout", (req, res) => {
  req.logout(() => {
    res.redirect("/login");
  });
});

// Route to display available time slots

// Combined login and signup page
app.get("/signup", (req, res) => {
  res.render("signup");
});

app.post("/signup", (req, res) => {
  const {
    username,
    password,
    userType,
    firstname,
    lastname,
    licenseNo,
    age,
    make,
    model,
    year,
    platno,
  } = req.body;

  bcrypt
    .hash(password, 10)
    .then((hashedPassword) => {
      const newUser = new User({
        username,
        password: hashedPassword,
        userType,
        firstname,
        lastname,
        licenseNo,
        age,
        car_details: {
          make,
          model,
          year,
          platno,
        },
      });

      return newUser.save();
    })
    .then(() => {
      res.redirect("/login");
    })
    .catch((err) => {
      console.error("Error during signup:", err);
      res.status(500).send("Error during signup");
    });
});

app.get("/appointment.js", (req, res) => {
  // Your logic to read and send the JavaScript file
  const javascriptCode = "console.log('Hello, this is your JavaScript code!');";

  // Set the Content-Type header to application/javascript
  res.setHeader("Content-Type", "application/javascript");

  // Send the JavaScript code as the response
  res.send(javascriptCode);
});
app.get("/  js/g2_page.js", (req, res) => {
  // Your logic to read and send the JavaScript file
  const javascriptCode = "console.log('Hello, this is your JavaScript code!');";

  // Set the Content-Type header to application/javascript
  res.setHeader("Content-Type", "application/javascript");

  // Send the JavaScript code as the response
  res.send(javascriptCode);
});

app.post("/createAppointment", authenticateAdmin, async (req, res) => {
  const { date, time } = req.body;

  const existingAppointment = await Appointment.findOne({ date, time });

  if (existingAppointment) {
    console.log("Appointment already exists for this date and time.");
    return res.redirect("/appointment");
  }

  const newAppointment = new Appointment({
    date,
    time,
    adminAdded: true,
    isTimeSlotAvailable: false, // Set to false when created by admin
  });

  newAppointment
    .save()
    .then(() => {
      console.log("Appointment created successfully.");
      res.redirect("/appointment");
    })
    .catch((err) => {
      console.error("Error creating appointment:", err);
      res.status(500).send("Error creating appointment");
    });
});
app.post("/bookAppointment", async (req, res) => {
  try {
    const { date, time } = req.body;

    // Check if the appointment is available
    const appointment = await Appointment.findOne({
      date,
      time,
      isTimeSlotAvailable: true,
    });

    if (!appointment) {
      return res
        .status(400)
        .json({ success: false, message: "Time slot not available" });
    }

    // Update the appointment to mark it as booked
    appointment.isTimeSlotAvailable = false;

    // Save the updated appointment
    await appointment.save();
    // Store the appointment ID in the user's appointments array
    if (!req.user.appointments) {
      req.user.appointments = []; // Initialize as an empty array if undefined
    }

    req.user.appointments.push(appointment._id);

    // Save the updated user document
    await req.user.save();

    // Send success response
    return res.json({
      success: true,
      message: "Appointment booked successfully",
    });
  } catch (error) {
    console.error("Error booking appointment:", error);
    return res
      .status(500)
      .json({ success: false, message: "Internal Server Error" });
  }
});

app.get("/getAvailableTimeSlots", (req, res) => {
  const selectedDate = req.query.date;

  // Find available time slots for the selected date
  Appointment.find({ date: selectedDate, isTimeSlotAvailable: true })
    .then((appointments) => {
      const availableTimeSlots = appointments.map(
        (appointment) => appointment.time
      );
      res.json(availableTimeSlots);
      console.log(availableTimeSlots);
    })
    .catch((error) => {
      console.error("Error fetching available time slots:", error);
      res.status(500).json({ error: "Internal Server Error" });
    });
});

app.get("/login", (req, res) => {
  res.render("login", { message: req.flash("error") });
});

app.post(
  "/login",
  passport.authenticate("local", {
    successRedirect: "/",
    failureRedirect: "/login",
    failureFlash: true,
  })
);

app.get("/logout", (req, res) => {
  req.logout();
  res.redirect("/");
});

app.get("/appointment", authenticateAdmin, (req, res) => {
  const availableTimeSlots = ["10:00 AM", "11:00 AM", "2:00 PM", "3:00 PM"];
  res.render("appointment", { user: req.user, availableTimeSlots });
});

app.post("/appointment", authenticateAdmin, (req, res) => {
  const { timeSlot } = req.body;

  const newAppointment = new Appointment({
    user: req.user._id, // or the appropriate user ID
    timeSlot,
  });

  newAppointment
    .save()
    .then(() => {
      res.redirect("/time-slots");
    })
    .catch((error) => {
      console.error("Error saving appointment:", error);
      res.status(500).send("Error saving appointment");
    });
});

app.get("/time-slots", authenticateAdmin, (req, res) => {
  // Fetch available time slots from the database or define them programmatically
  const availableTimeSlots = ["10:00 AM", "11:00 AM", "2:00 PM", "3:00 PM"];

  res.render("time_slots", { availableTimeSlots });
});

app.get("/", (req, res) => {
  // Check if the user is authenticated and redirect them to the dashboard page
  if (req.isAuthenticated()) {
    res.render("dashboard", { user: req.user }); // Make sure you're passing the user object here
  } else {
    res.redirect("/login");
  }
});

app.get("/dashboard", (req, res) => {
  // Check if the user is authenticated and redirect them to the dashboard page
  if (req.isAuthenticated()) {
    res.render("dashboard", { user: req.user }); // Make sure you're passing the user object here
  } else {
    res.redirect("/login");
  }
});

// app.get("/g2", authenticateDriver, (req, res) => {
//   // Check if the user is authenticated and handle the G2 page accordingly
//   if (req.isAuthenticated() && req.user.userType === "Driver") {
//     const user = req.user;

//     // Assuming your User model fields match the form field names
//     const userData = {
//       firstname: user.firstname,
//       lastname: user.lastname,
//       licenseNo: user.licenseNo,
//       age: user.age,
//       dob: user.dob,
//       car_details: {
//         make: user.car_details.make,
//         model: user.car_details.model,
//         year: user.car_details.year,
//         platno: user.car_details.platno,
//       },
//     };

//     res.render("g2", { user: userData });
//   } else {
//     res.redirect("/login");
//   }
// });

app.get("/g2", authenticateDriver, async (req, res) => {
  try {
    if (req.isAuthenticated()) {
      const username = req.user.username;

      const user = await User.findOne({ username: username });

      if (user) {
        if (user.car_details) {
          const make = user.car_details.make;
          const model = user.car_details.model;
          const year = user.car_details.year;
          const platno = user.car_details.platno;

          // Fetch available appointments for the current date
          const currentDate = new Date().toISOString().split("T")[0];
          const appointments = await Appointment.find({
            date: currentDate,
            isTimeSlotAvailable: true,
          });

          const availableTimeSlots = appointments.map(
            (appointment) => appointment.time
          );

          // Render the page and pass user and appointment data to the view
          res.render("g2", {
            user: req.user,
            carDetails: user.car_details,
            availableTimeSlots,
          });
        } else {
          res.render("g2", { user: req.user, carDetails: null });
        }
      } else {
        res.status(404).send("User not found");
      }
    } else {
      res.redirect("/login");
    }
  } catch (err) {
    console.error("Error while fetching data for g2 page:", err);
    res.status(500).send("Internal Server Error");
  }
});

app.post("/g", async (req, res) => {
  const licenseNumber = req.body.licenseNumber;

  try {
    const user = await User.findOne({ licenseNo: licenseNumber }).exec();

    if (user) {
      res.render("g", { user });
    } else {
      res.render("g", { user: null });
    }
  } catch (err) {
    console.error("Error finding user by license number:", err);
    res.status(500).send("Error finding user by license number");
  }
});

app.get("/g", authenticateDriver, async (req, res) => {
  // Check if the user is authenticated and handle the G page accordingly
  if (req.isAuthenticated()) {
    const username = req.user.username;

    try {
      const user = await User.findOne({ username: username });

      if (user) {
        if (user.car_details) {
          // Access car details for the user
          const make = user.car_details.make;
          const model = user.car_details.model;
          const year = user.car_details.year;
          const platno = user.car_details.platno;

          // Render the page and pass car details to the view
          res.render("g", { user: req.user, carDetails: user.car_details });
        } else {
          // Handle the case when car details are not present
          res.render("g", { user: req.user, carDetails: null });
        }
      } else {
        // Handle the case when the user is not found
        res.status(404).send("User not found");
      }
    } catch (err) {
      // Handle any errors that may occur while fetching the user
      console.error("Error while fetching user from the database:", err);
      res.status(500).send("Error while fetching user from the database");
    }
  } else {
    res.redirect("/login");
  }
});

app.post("/updateCarInfo", (req, res) => {
  // Update car information based on user authentication
  if (req.isAuthenticated()) {
    const updatedCarInfo = {
      make: req.body.make,
      model: req.body.model,
      year: req.body.year,
      platno: req.body.platno,
    };

    User.updateOne(
      { username: req.user.username },
      { car_details: updatedCarInfo }
    )
      .then(() => {
        res.redirect("/g");
      })
      .catch((err) => {
        console.error("Error updating car information:", err);
      });
  } else {
    res.redirect("/login");
  }
});

app.post("/g2", (req, res) => {
  // Check if the user is authenticated and handle the POST request
  if (req.isAuthenticated() && req.user.userType === "Driver") {
    const user = req.user;
    const {
      firstname,
      lastname,
      licenseNo,
      age,
      dob,
      make,
      model,
      year,
      platno,
    } = req.body;

    // Define the update object using $set
    const updateObject = {
      $set: {
        firstname,
        lastname,
        licenseNo,
        age,
        dob,
      },
    };

    if (!user.car_details) {
      user.car_details = {}; // Initialize the car_details object if it doesn't exist
    }

    // Add car_details fields to the updateObject using $set
    updateObject.$set["car_details.make"] = make;
    updateObject.$set["car_details.model"] = model;
    updateObject.$set["car_details.year"] = year;
    updateObject.$set["car_details.platno"] = platno;

    // Use findOneAndUpdate to update the user's information and return a promise
    User.findOneAndUpdate({ username: user.username }, updateObject, {
      new: true,
    })
      .then((updatedUser) => {
        console.log("User information updated successfully.");
        res.redirect("/g2");
      })
      .catch((err) => {
        console.error("Error updating user information:", err);
        res.status(500).send("Error updating user information");
      });
  } else {
    res.redirect("/login");
  }
});

router.get("/getAdminAppointments", (req, res) => {
  // Add logic to fetch admin appointments from the database
  Appointment.find(/* your query here */)
    .then((adminAppointments) => {
      // Send the admin appointments as JSON response
      res.json(adminAppointments);
    })
    .catch((error) => {
      console.error("Error fetching admin appointments:", error);
      res.status(500).json({ error: "Internal Server Error" });
    });
});
app.use("/", router);

// Start the server
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
