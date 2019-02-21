import flatpickr from "flatpickr"
import "flatpickr/dist/themes/airbnb.css" // A path to the theme CSS
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

flatpickr("#rental_checkindate", {
  altInput: true,
  plugins: [new rangePlugin({ input: "#rental_checkoutdate"})],
    confirmIcon: "<i class='fa fa-check'></i>", // your icon's html, if you wish to override
    confirmText: "OK ",
    showAlways: false,
    theme: "light" // or "dark"
})

// flatpickr("#rental_checkindate", {
//   altInput: true,
//   plugins: [new rangePlugin({ input: "#rental_checkoutdate"})],
//     confirmIcon: "<i class='fa fa-check'></i>", // your icon's html, if you wish to override
//     confirmText: "OK ",
//     showAlways: false,
//     theme: "light" // or "dark"

// })

