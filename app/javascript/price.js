function price() {
  const yen = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  yen.addEventListener("input", value);
  function value(e){
    tax.textContent = (e.target.value)*0.1;
    profit.textContent = (e.target.value)*0.9;
  };
};

window.addEventListener("load", price);