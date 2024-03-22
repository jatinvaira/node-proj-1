const express = require('express');
const router = express.Router();
const Appointment = require('../models/appointment');
const { authenticateAdmin } = require('../middleware/authMiddleware');

async function isTimeSlotAvailable(date, time) {
  try {
    const existingAppointment = await Appointment.findOne({ date, time });
    return !existingAppointment;
  } catch (err) {
    console.error('Error checking time slot availability:', err);
    throw err; // Rethrow the error for better handling
  }
}
router.post('/bookAppointment', async (req, res) => {
  const { date, time } = req.body;

  try {
    const bookedAppointment = await Appointment.findOneAndUpdate(
      { date, time, isTimeSlotAvailable: true },
      { isTimeSlotAvailable: false },
      { new: true }
    );

    if (!bookedAppointment) {
      console.log('Appointment already booked or time slot not available.');
      return res.json({ success: false, message: 'Appointment already booked or time slot not available.' });
    }

    console.log('Appointment booked successfully.');
    res.json({ success: true, message: 'Appointment booked successfully' });
  } catch (err) {
    console.error('Error booking appointment:', err);
    res.status(500).json({ success: false, message: 'Error booking appointment' });
  }
});

// Route to handle appointment creation for users
router.post('/createAppointment', authenticateAdmin, async (req, res) => {
  const { date, time } = req.body;

  try {
    // Check if the appointment already exists
    const existingAppointment = await Appointment.findOne({ date, time });

    if (existingAppointment) {
      console.log('Appointment already exists for this date and time.');
      return res.redirect('/appointment');
    }

    // Create a new appointment with adminAdded set to true
    const newAppointment = new Appointment({
      date,
      time,
      adminAdded: true,
    });

    // Save the new appointment
    await newAppointment.save();
    console.log('Appointment created successfully.');
    res.redirect('/appointment');
  } catch (err) {
    console.error('Error creating appointment:', err);
    res.status(500).send('Error creating appointment');
  }
});

// Other appointment routes...

module.exports = router;
