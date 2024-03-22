
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
const bodyParser = require('body-parser');
const path = require('path');
const flash = require("connect-flash");



// Route to get available time slots
router.get('/getAvailableTimeSlots', async (req, res) => {
  try {
    const selectedDate = req.query.date;

    // Find available time slots for the selected date
    const appointments = await Appointment.find({ date: selectedDate, isTimeSlotAvailable: true });

    const availableTimeSlots = appointments.map(appointment => appointment.time);

    res.json(availableTimeSlots);
  } catch (error) {
    console.error('Error fetching available time slots:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Route to get admin appointments
router.get('/getAdminAppointments', async (req, res) => {
  try {
    // Add logic to fetch admin appointments from the database
    const adminAppointments = await Appointment.find(/* your query here */);

    // Send the admin appointments as JSON response
    res.json(adminAppointments);
  } catch (error) {
    console.error('Error fetching admin appointments:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

module.exports = router;
