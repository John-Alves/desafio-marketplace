require("@rails/ujs").start();
require("turbolinks").start();
require("channels");
global.jQuery, global.$ = require("jquery");

document.addEventListener('turbolinks:load', () => {
    let navs = document.querySelectorAll('.sidenav');
    M.Sidenav.init(navs, {});

    let dropdowns = document.querySelectorAll(".dropdown-trigger");
    M.Dropdown.init(dropdowns, {});

    let flashMessages = document.querySelectorAll(".flash-messages");
    flashMessages.forEach((element, index) => {
        if (element.textContent){
            M.toast({html: element.textContent, displayLength: 3000})
        }
    })
});