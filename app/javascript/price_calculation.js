document.addEventListener('DOMContentLoaded', function() {
  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  if (priceInput) {
    priceInput.addEventListener('input', function() {
      const inputValue = priceInput.value;
      
   
      if (inputValue.match(/^[0-9]+$/)) {
        const price = parseInt(inputValue);
        
        
        const fee = Math.floor(price * 0.1);
        

        const profitAmount = Math.floor(price - fee);
        
          
        addTaxPrice.textContent = fee.toLocaleString();
        profit.textContent = profitAmount.toLocaleString();
      } else {
    
        addTaxPrice.textContent = '';
        profit.textContent = '';
      }
    });
  }
});