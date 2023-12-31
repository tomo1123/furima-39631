function calculateFees() {
  const priceInput = document.getElementById('item-price');
  if (priceInput) {
      priceInput.addEventListener("input", () => {
        const inputValue = priceInput.value;
        const addTaxDom = document.getElementById("add-tax-price");
        const profitDom = document.getElementById('profit');
        if (inputValue >= 300 && inputValue <= 9999999) {
          const tax = Math.floor(inputValue * 0.1);
          const profit = inputValue - tax;
          addTaxDom.textContent = tax;
          profitDom.textContent = profit;
        } else {
          addTaxDom.textContent = '0';
          profitDom.textContent = '0';
        }
      }
    );
  }
}

document.addEventListener('turbo:load', calculateFees);
document.addEventListener('turbo:render', calculateFees);