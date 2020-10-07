function feeAndProfit(){
  const priceinput = document.getElementById("item-price")
  priceinput.addEventListener("keyup",()=>{
  const price = document.getElementById("item-price")
  const pricevalue = price.value
  const itemfee = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  const itemfeecalc = itemfee.innerText = pricevalue * 0.1
  profit.innerText = (pricevalue - itemfeecalc)

})}

window.addEventListener("load",feeAndProfit)
