function input() {
  const priceInput = document.getElementById("item-price")
  const addTaxDom = document.getElementById("add-tax-price")
  const salesProfit = document.getElementById("profit")
  priceInput.addEventListener("input",function() {
    const inputValue = priceInput.value
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    salesProfit.innerHTML = Math.floor(inputValue * 1.1)
  })
}

window.addEventListener('load', input)