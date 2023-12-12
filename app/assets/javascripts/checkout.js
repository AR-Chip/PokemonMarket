document.addEventListener('DOMContentLoaded', function() {
    const checkoutButton = document.getElementById('checkoutButton'); 
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  
    checkoutButton.addEventListener('click', function(event) {
      event.preventDefault();
  
      fetch('/checkout/create', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/javascript',
          'X-CSRF-Token': csrfToken,
        }
      })
      .then(response => response.text())
      .then(jsResponse => eval(jsResponse))
      .catch(error => {
        console.error('Error:', error);
      });
    });
  });