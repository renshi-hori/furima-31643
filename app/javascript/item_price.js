window.addEventListener('load', () => {
  console.log("OK");
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
     console.log("イベント発火");
     const inputValue = priceInput.value;
     const addTaxDom = document.getElementById("add-tax-price");
     addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
     const addProfit = document.getElementById("profit");
     addProfit.innerHTML = Math.floor(inputValue * 0.9)
  })
});
