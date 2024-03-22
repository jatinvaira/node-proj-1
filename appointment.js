
const mongoose = require('mongoose');

const appointmentSchema = new mongoose.Schema({
  date: { type: Date, required: true },
  time: { type: String, required: true },
  adminAdded: { type: Boolean, default: false }, // New field to track admin-added appointments
  isTimeSlotAvailable: { type: Boolean, default: true },
});

module.exports = mongoose.model('Appointment', appointmentSchema);
