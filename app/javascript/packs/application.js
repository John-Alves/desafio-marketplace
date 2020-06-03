require("@rails/ujs").start();
require("turbolinks").start();
require("channels");
global.jQuery, global.$ = require("jquery");
import 'materialize-css/dist/js/materialize';
import './template';

document.addEventListener('turbolinks:load', () => {
    console.log("JQuery ok!")
});