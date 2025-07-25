// 価格計算
document.addEventListener('DOMContentLoaded', calculatePrice);
document.addEventListener('turbo:load', calculatePrice);

function calculatePrice() {
  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  if (priceInput) {
    priceInput.removeEventListener('input', handlePriceInput);
    priceInput.addEventListener('input', handlePriceInput);
  }

  function handlePriceInput() {
    const inputValue = priceInput.value;
    
    // 数値のみの場合のみ計算
    if (inputValue.match(/^[0-9]+$/)) {
      const price = parseInt(inputValue);
      
      // 販売手数料の計算
      const fee = Math.floor(price * 0.1);
      
      // 販売利益の計算
      const profitAmount = Math.floor(price - fee);
      
      // 更新
      addTaxPrice.textContent = fee.toLocaleString();
      profit.textContent = profitAmount.toLocaleString();
    } else {
      // 無効な入力の場合は空にする
      addTaxPrice.textContent = '';
      profit.textContent = '';
    }
  }
}