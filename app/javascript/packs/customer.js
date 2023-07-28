
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
 console.log("aditya")
