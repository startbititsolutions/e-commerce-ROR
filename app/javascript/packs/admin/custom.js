document.addEventListener('DOMContentLoaded', function() {
  // Use jQuery to select elements consistently
  const deleteButtons = $(".delete-button");
  const deleteForms = $(".delete-form");

  deleteButtons.on("click", function(e) {
    e.preventDefault();
    const confirmMessage = $(this).data("confirm") || "Are you sure?";
    if (confirm(confirmMessage)) {
      const deleteForm = $(`.delete-form[data-image-id="${$(this).data("imageId")}"]`);
      deleteForm.submit();
    }
  });

  $(".feature-checkbox").on("change", function() {
    if ($(this).prop("checked")) {
      $(".feature-checkbox").not(this).prop("checked", false);
    }
  });

  $(".dropdown-toggle").on("click", function() {
    $(this).siblings(".dropdown-menu").toggle();
  });

  $("#carouselExampleControls").on("slide.bs.carousel", function(event) {
    var newIndex = $(event.relatedTarget).index();
    // newIndex represents the index of the newly active slide
    // You can perform any additional actions based on the newIndex value here
  });

  $(".gallery-thumbnail").click(function() {
    var slideTo = $(this).data("slide_to");
    console.log($(this));
    $("#productCarousel").carousel(parseInt(slideTo));
  });

  $(".btn-tool").click(function() {
    var card = $(this).closest(".card");
    var cardBody = card.find(".card-body");

    if (cardBody.is(":visible")) {
      cardBody.slideUp();
      $(this).find("i").removeClass("fa-minus").addClass("fa-plus");
    } else {
      cardBody.slideDown();
      $(this).find("i").removeClass("fa-plus").addClass("fa-minus");
    }
  });

  var currencySelect = $("#currency-select");
  var prices = $(".product-price");
  var conversionRates = {
    USD: 1,
    EUR: 0.9,
    GBP: 0.8,
  };
  var currencySymbols = {
    USD: "$",
    EUR: "€",
    GBP: "£",
    "": "₹",
  };

  function convertPrices(currency) {
    var conversionRate = conversionRates[currency];
    var currencySymbol = currencySymbols[currency];
    console.log("currency");
    console.log(currency);
    prices.each(function() {
      var originalPrice = parseFloat($(this).data("original-price"));
      var convertedPrice;

      if (currency === "") {
        convertedPrice = originalPrice;
      } else {
        convertedPrice = originalPrice * conversionRate;
      }

      $(this).text(currencySymbol + convertedPrice.toFixed(2));
    });
  }

  // Check if currencySelect element exists before adding the event listener
  if (currencySelect.length > 0) {
    currencySelect.on("change", function() {
      var selectedCurrency = $(this).val();
      convertPrices(selectedCurrency);
      console.log(selectedCurrency);
    });

    var selectedCurrency = currencySelect.val();
    convertPrices(selectedCurrency);
  } else {
    // If currencySelect element doesn't exist, convert with an empty currency
    convertPrices("");
  }
  // const deleteForms = $(".delete-form");
 
});
