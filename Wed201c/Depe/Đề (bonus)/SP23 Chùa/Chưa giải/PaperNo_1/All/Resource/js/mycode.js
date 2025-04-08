// Event listener to update the tour price when a tour is selected
document.getElementById("tour").addEventListener("change", function () {
  const tourId = this.value;
  const tourPrice = getPriceByTour(tourId);

  if (isNaN(tourPrice)) {
    document.getElementById("tour-price").textContent =
      "Invalid tour selection.";
  } else {
    document.getElementById(
      "tour-price"
    ).textContent = `${tourPrice}$ / Person`;
  }
});

// Function to calculate and display the total price when the "Book tour" button is clicked
function calTotal() {
  // Get selected tour price
  const tourId = document.getElementById("tour").value;
  const tourPrice = getPriceByTour(tourId);

  // Check if the price is valid
  if (isNaN(tourPrice)) {
    document.getElementById("total-price").textContent =
      "Invalid tour selection.";
    return;
  }

  // Get the number of people
  const numberOfPeople = parseInt(document.getElementById("number").value, 10);

  // Validate the number of people
  if (isNaN(numberOfPeople) || numberOfPeople <= 0) {
    document.getElementById("total-price").textContent =
      "Invalid number of people.";
    return;
  }

  // Calculate the total price
  const totalPrice = tourPrice * numberOfPeople;

  // Display the total price
  document.getElementById(
    "total-price"
  ).textContent = `Total amount: ${totalPrice}$`;
}

// Function to return the price for the selected tour based on the tour ID
function getPriceByTour(id) {
  switch (id) {
    case "1":
      return 150;
    case "2":
      return 200;
    case "3":
      return 250;
    default:
      return NaN; // Return NaN if the ID is invalid
  }
}
