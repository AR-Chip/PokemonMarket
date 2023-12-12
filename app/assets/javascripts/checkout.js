// Add an event listener to handle the button click
document.addEventListener('DOMContentLoaded', function() {
    const checkoutButton = document.getElementById('checkoutButton'); // Change to your button's ID
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  
    checkoutButton.addEventListener('click', function(event) {
      event.preventDefault(); // Prevent default form submission
  
      fetch('/checkout/create', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/javascript',
          'X-CSRF-Token': csrfToken,
        }
      })
      .then(response => response.text())
      .then(jsResponse => eval(jsResponse)) // Evaluate JavaScript response
      .catch(error => {
        console.error('Error:', error);
        // Handle errors if any
      });
    });
  });