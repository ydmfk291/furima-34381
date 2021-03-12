function getPrice() {
  const inputPrice = document.getElementById("item-price")
  inputPrice.addEventListener("input", () => {
    const inputValue = inputPrice.value
    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    const addProfitDom = document.getElementById("profit")
    addProfitDom.innerHTML = Math.floor(inputValue - (inputValue * 0.1))
  })
}
window.addEventListener('load',getPrice)