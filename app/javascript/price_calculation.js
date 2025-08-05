// 価格計算処理
document.addEventListener('turbo:load', function () {
  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  if (!priceInput) return;

  priceInput.removeEventListener('input', handlePriceInput);
  priceInput.addEventListener('input', handlePriceInput);

  // 初期値がある場合は即時計算
  if (priceInput.value) handlePriceInput();

  function handlePriceInput() {
    const inputValue = priceInput.value;
    if (inputValue.match(/^[0-9]+$/)) {
      const price = parseInt(inputValue, 10);
      const fee = Math.floor(price * 0.1);
      const profitAmount = price - fee;
      addTaxPrice.textContent = fee.toLocaleString();
      profit.textContent = profitAmount.toLocaleString();
    } else {
      addTaxPrice.textContent = '';
      profit.textContent = '';
    }
  }
});
