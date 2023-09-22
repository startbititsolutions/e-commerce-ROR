
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'jquery';
import "popper.js";
import "bootstrap"
import 'tinymce';
import 'owl.carousel/dist/owl.carousel';
import 'owl.carousel/dist/assets/owl.carousel.css';
import MixItUp from 'mixitup';

Rails.start()
Turbolinks.start()
ActiveStorage.start()



// import './customer/jquery-3.3.1.min.js'
// import './customer/bootstrap.min.js'
import './customer/jaquery.nice-select.min.js'
import './customer/jbquery-ui.min.js'
import './customer/jquery.slicknav.js' 
// import './customer/mabowl.carousel.min.js'
import './customer/main.js'
// this code for the feature search


document.addEventListener('DOMContentLoaded', () => {
  $(".loader").fadeOut();
  $("#preloder").delay(200).fadeOut("slow");

  /*------------------
      Gallery filter
  --------------------*/
  $('.featured__controls li').on('click', function () {
      $('.featured__controls li').removeClass('active');
      $(this).addClass('active');
  });
  if ($('.featured__filter').length > 0) {
      var containerEl = document.querySelector('.featured__filter');
      var mixer = MixItUp(containerEl);
      console.log(containerEl)
  }
});
$(document).on("click", ".increase-btn", function(event) {
    event.preventDefault();
    var lineItemId = $(this).data("line-item-id");
    updateQuantity(lineItemId, 1); 
  });
  
  $(document).on("click", ".decrease-btn", function(event) {
    event.preventDefault();
    var lineItemId = $(this).data("line-item-id");
    updateQuantity(lineItemId, -1); 
  });
  
  function updateQuantity(lineItemId, change) {
    var inputField = $("#quantity-input-" + lineItemId);
    var newValue = parseInt(inputField.val()) + change;
    if (newValue < 1) return; // Prevent negative quantity
  
    $.ajax({
      url: "/line_items/" + lineItemId,
      type: "POST",
      dataType: "json",
      data: { quantity: newValue },
      success: function(data) {
        console.log(data)
        inputField.val(data.quantity); 
        updateSubtotal(lineItemId, data.total_price); 
        updateCartTotal(data.cart_total); 
        updateTotalPrice(data.total_price, lineItemId);
        updateTotalItem(data.total_item, lineItemId);
        updateTotalItemTotal(data.total_item_total);
        updateDiscountPrice(data.discount_price,lineItemId);

      },
      error: function(error) {
        console.error("Error updating quantity:", error);
      }
    });
  }
  
  function formatCurrency(amount) {
    return new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(amount);
  } 
  function updateTotalPrice(newTotalPrice, lineItemId) {
  
    var totalPriceElement = $(".total-price[data-line-item-id='" + lineItemId + "']");

    var currencySymbol = "$";
    var formattedTotalPrice = formatCurrency(newTotalPrice);
    totalPriceElement.text(formattedTotalPrice);
  } 
  function  updateTotalItem(newTotalItem, lineItemId) {
 
    var totalItemElement = $(".item-price[data-line-item-id='" + lineItemId + "']");
    var currencySymbol = "$";
    var formattedTotalPrice1 = formatCurrency(newTotalItem);
    totalItemElement.text(formattedTotalPrice1);
  }
  function updateSubtotal(lineItemId, newSubtotal) {
    var subtotalElement = $("#line-item-subtotal-" + lineItemId);
    var currencySymbol = "$";
      var formattedTotalPrice = formatCurrency(newSubtotal);
    subtotalElement.text(formattedTotalPrice);
  }
  
  function updateCartTotal(newCartTotal) {
    var cartTotalElement = $(".shoping__checkout li:nth-last-child(1) span");
    var currencySymbol = "$";
    var formattedTotalPrice = formatCurrency(newCartTotal);
    cartTotalElement.text(formattedTotalPrice);
  }
  function updateTotalItemTotal(newTotalItem)
  {
    var cartTotalElement1 = $(".shoping__checkout li:nth-last-child(2) span");
    var currencySymbol = "$";
    var formattedTotalPrice1 = formatCurrency(newTotalItem);
    cartTotalElement1.text(formattedTotalPrice1);
  }
   function updateDiscountPrice(newDiscountPrice,lineItemId)
   {
    var discountTotalElement1 = $(".discount_element[data-line-item-id='" + lineItemId + "']");
  
    discountTotalElement1.text(newDiscountPrice);

   }
 
    // Listen for changes in the "Specific Vendor" radio button
   

  

 console.log("aditya")
 