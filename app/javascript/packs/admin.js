import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'jquery';
// import $ from 'jquery';
import "popper.js";
import "bootstrap"
import 'tinymce';
// import 'select2'
// import 'select2/dist/css/select2'
import 'selectize';



Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")

// import './customer/jquery-3.3.1.min.js'
import './admin/custom';
$(document).on('turbolinks:load', function() {
  $('#productdetail-dropdown').selectize({
    plugins: ['remove_button'],
    delimiter: ',', 
    valueField: 'id', 
    labelField: 'product_title', 
    searchField: ['product_title'], 
    options: [], 
    create: false, 
    preload: 'focus', 
    multiple: true, 
  });
  $('#vendor-dropdown').selectize({
    plugins: ['remove_button'],
    delimiter: ',', 
    valueField: 'id', 
    labelField: 'first_name', 
    searchField: ['first_name'], 
    options: [], 
    create: false, 
    preload: 'focus',
    multiple: true, 
  });
  customerSegmentOption.addEventListener('change', function () {
    if (this.checked) {
      customerSelectionField.style.display = 'block';
    }
  });


// const vendorSelectize = $('#vendor-dropdown')[0].selectize;
// const productSelectize = $('#productdetail-dropdown')[0].selectize;
// console.log(vendorSelectize);
// console.log(productSelectize);

// vendorSelectize.on('change', function() {
//   const selectedVendors = vendorSelectize.getValue(); 


//   productSelectize.clearOptions();

//   if (selectedVendors.length > 0) {

//     productSelectize.load(function(callback) {
//       $.ajax({
//         url: '/admin/productdetails/filter_by_vendor', 
//         data: { vendors: selectedVendors },
//         success: function(data) {
        
//           callback(data);
//         },
//         error: function() {
        
//         }
//       });
//     });
//   } else {
   
//     productSelectize.load();
//   }
// });





});

