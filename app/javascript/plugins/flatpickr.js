import flatpickr from "flatpickr"
import "flatpickr/dist/themes/airbnb.css" // A path to the theme CSS
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

flatpickr("#rental_checkindate", {
  altInput: true,
  plugins: [new rangePlugin({ input: "#rental_checkoutdate"})]
})
