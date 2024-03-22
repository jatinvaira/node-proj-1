const UserSchema = new mongoose.Schema({

  // Add an array to store appointment IDs
  appointments: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'Appointment',
    },
  ],
});

const User = mongoose.model('User', UserSchema);
