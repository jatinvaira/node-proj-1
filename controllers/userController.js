const passport = require('passport');
const User = require('../models/user');

// Controller function to handle user registration
exports.registerUser = async (req, res) => {
  const { username, password, userType } = req.body;

  try {
    // Check if the username is already taken
    const existingUser = await User.findOne({ username });

    if (existingUser) {
      return res.render('register', { errorMessage: 'Username already exists' });
    }

    // Create a new user
    const newUser = new User({ username, password, userType });
    await newUser.save();

    // Log in the new user
    req.login(newUser, (loginErr) => {
      if (loginErr) {
        console.error(loginErr);
        return res.status(500).send('Internal Server Error');
      }

      // Redirect or render success message as needed
      res.redirect('/dashboard'); // Example redirect to dashboard after registration
    });
  } catch (error) {
    console.error(error);
    res.status(500).send('Internal Server Error');
  }
};

// Controller function to handle user login
exports.loginUser = passport.authenticate('local', {
  successRedirect: '/dashboard',
  failureRedirect: '/login',
  failureFlash: true,
});

// Controller function to handle user logout
exports.logoutUser = (req, res) => {
  req.logout();
  res.redirect('/');
};

