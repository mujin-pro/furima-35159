window.addEventListener('load',() => {
  const FormPrice = document.getElementById("item-price")
  FormPrice.addEventListener("input",() => {
    InputPrice = FormPrice.value
    AddTaxPrice = document.getElementById("add-tax-price")
    AddTaxPrice.innerHTML = Math.floor(InputPrice * 0.1)
    Profit = document.getElementById("profit")
    Profit.innerHTML = Math.floor(InputPrice - (InputPrice * 0.1 )) 
  })

});