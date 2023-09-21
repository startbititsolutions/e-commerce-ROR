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
  $(document).ready(function() {
    
    var productSelectize = $('#productdetail-dropdown')[0].selectize;
    

    $('#vendor-dropdown').change(function() {
      var selectedVendorIds = $(this).val();
  

      if (!selectedVendorIds || selectedVendorIds.length === 0) {
        productSelectize.clear();
        return;
      }
  

      $.ajax({
        url: '/admin/discounts/get_productdetail_by_vendor', 
        method: 'GET',
        data: { vendor_ids: selectedVendorIds },
        success: function(response) {
        
          productSelectize.clear();
  
    
          response.forEach(function(product) {
            productSelectize.addItem(product.id, true);
          });
        },
        error: function() {
 
          console.error('Failed to fetch products for the selected vendors.');
        }
      });
    });
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

