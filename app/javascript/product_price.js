window.addEventListener('load',() => {
  const FormPrice = document.getElementById("item-price")
  FormPrice.addEventListener("input",() => {
    InputPrice = FormPrice.value
    AddTaxPrice = document.getElementById("add-tax-price")
    AddTaxPrice.innerHTML = InputPrice * 0.1
    Profit = document.getElementById("profit")
    Profit.innerHTML = InputPrice - ( InputPrice * 0.1 ) 
  })

});