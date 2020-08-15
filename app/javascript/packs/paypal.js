document.addEventListener('DOMContentLoaded', function() {
  paypal.Buttons({
    createOrder: function(data, actions) {
      const amount = document.getElementById('funding_amount').value;
      const anonymous = document.getElementById('anonymous').checked;
      console.log(amount, anonymous);
      if (amount && parseInt(amount) <= 0) {
        return;
      }
      var xhr = new XMLHttpRequest();
      xhr.open('POST', '/orders', true);
      xhr.onreadystatechange = function() {
        if (xhr.readyState != 4) return;
        if (xhr.status != 200) {
          // alert(xhr.status + ': ' + xhr.statusText);
        } else {
          // alert(xhr.responseText);
        }
      }
      xhr.send(JSON.stringify({
        amount: amount,
        anonymous: anonymous,
      }));
      return actions.order.create({
        purchase_units: [{
          amount: {
            value: document.getElementById('funding_amount').value
          }
        }]
      });
    },
    onApprove: function(data, actions) {
      // This function captures the funds from the transaction.
      return actions.order.capture().then(function(details) {
        // This function shows a transaction success message to your buyer.
        console.log('details', details)
        alert('Transaction completed by ' + details.payer.name.given_name);
      });
    }
  }).render('#paypal-button-container');
});
