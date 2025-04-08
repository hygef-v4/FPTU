
function CalTotal() {
    let total = 0,
      menuListItem = document.querySelectorAll(".menu-list")[0], // first menu 
      menuListCart = document.querySelectorAll(".menu-list")[1], // second menu
      totalPrice = document.getElementById("total-price"),       // total price 
      checkedItems = menuListItem.querySelectorAll("input[type='checkbox']:checked"),   // check box selected 
      menuListFooter = menuListCart.querySelector(".menu-list-footer"), // footer to display total 
      menuListCartContent = menuListCart.querySelector(".menu-list-content"); // all selected content list in second menu

    // Clear previous cart content
    menuListCartContent.innerHTML = "";

    // Add selected items to the cart
    checkedItems.forEach((item) => {    // loop through all check box 
      const itemName = item.parentElement.querySelector("label").innerText;   
      //get parent of it and refer to label 
      total += Number(item.value); // Add item value to total
      menuListCartContent.innerHTML += `
        <div class="menu-list-item-name">
          <div><label>${itemName}</label></div>
        </div>`;           // add content 
    });

    // Update total price
    totalPrice.innerText = "$" + total.toFixed(2);

    // Converts the total to a string with two decimal places (e.g., $5.00).

    // Show or hide the footer based on the total amount
    if (total > 0) {
      menuListFooter.style.display = "block";
    } else {
      menuListFooter.style.display = "none";
    }
  }