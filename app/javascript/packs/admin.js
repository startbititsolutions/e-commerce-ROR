import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'jquery';
// import $ from 'jquery';
import "popper.js";
import "bootstrap"
import 'tinymce';


Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")

import './admin/custom';

console.log("aditya")

