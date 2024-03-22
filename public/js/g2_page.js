function fetchAdminAppointments(selectedDate) {
  fetch(`/getAdminAppointments?date=${selectedDate}`)
    .then((response) => response.json())
    .then((data) => {
      // Display the admin-added appointments
      const adminAppointmentsContainer =
        document.getElementById("adminAppointments");
      adminAppointmentsContainer.innerHTML = "";

      data.forEach((appointment) => {
        const div = document.createElement("div");
        div.innerText = `${appointment.date} - ${appointment.time}`;
        adminAppointmentsContainer.appendChild(div);
      });
    })
    .catch((error) => {
      console.error("Error fetching admin-added appointments:", error);
    });
}

// Add a function to fetch available time slots based on the selected date
async function fetchAvailableTimeSlots() {
  try {
    const selectedDate = document.getElementById("selectedDate").value;

    const response = await fetch(`/getAvailableTimeSlots?date=${selectedDate}`);

    // Check if the response is not empty
    if (!response.ok) {
      throw new Error('Empty response or other error');
    }

    const data = await response.json();
    console.log('Fetched Data:', data);

    const timeSlotsContainer = document.getElementById("availableTimeSlots");

    // Check if the container element is found
    if (timeSlotsContainer) {
      timeSlotsContainer.innerHTML = "";

      data.forEach((timeSlot) => {
        console.log('Individual Time Slot:', timeSlot);

        if (timeSlot && timeSlot.time) {
          const button = document.createElement("button");
          button.innerText = timeSlot.time;
          button.onclick = () => bookAppointment(timeSlot.date, timeSlot.time);
          timeSlotsContainer.appendChild(button);
        }
      });
    } else {
      console.error("Error: Element with ID 'availableTimeSlots' not found");
    }

    // Fetch and display admin-added appointments
    await fetchAdminAppointments(selectedDate);
  } catch (error) {
    console.error("Error fetching available time slots:", error);
  }
}

function bookAppointment(date, time) {
  // Implement the logic to book the selected appointment
  const bookingData = { date, time };

  // Example fetch request to book the appointment
  fetch("/bookAppointment", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(bookingData),
  })
    .then((response) => {
      // Check if the response is not empty
      if (response.ok) {
        return response.json();
      } else {
        throw new Error('Empty response or other error');
      }
    })
    .then((data) => {
      console.log('Server Response:', data);

      // Continue with the rest of your code
      if (data.success) {
        // Update the client-side view or take any other actions
        console.log('Appointment booked successfully!');
        // You can display a success message to the user or redirect them to a confirmation page
      } else {
        console.error('Error booking appointment:', data.message);
        // Handle the error (e.g., show an error message to the user)
        if (data.message === 'Time slot not available') {
          alert('The selected time slot is not available. Please choose another.');
        } else {
          alert('An error occurred while booking the appointment. Please try again later.');
        }
      }
    })
    .catch((error) => {
      console.error('Error:', error);
    });
}

// Fetch available time slots on page load
fetchAvailableTimeSlots();
