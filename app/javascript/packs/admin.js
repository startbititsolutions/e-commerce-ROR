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

  const vendorSelectize = $('#vendor-dropdown');
  const productSelectize = $('#productdetail-dropdown-selectized');

  vendorSelectize.on('change', function () {
    const selectedVendors = vendorSelectize.find(":selected").val();
    console.log(selectedVendors);

    if (selectedVendors) {
      const filterByVendorUrl = $('#vendor-dropdown').data('filter-url'); 
      console.log(filterByVendorUrl);

      $.ajax({
        url: filterByVendorUrl,
        type: 'GET',
        data: { vendors: selectedVendors },
        success: function (data) {
       
        
          productSelectize.load(function (callback) {
            callback(data);
          });
        },
        error: function () {
          
        },
       
      });
    } 
  });




});

