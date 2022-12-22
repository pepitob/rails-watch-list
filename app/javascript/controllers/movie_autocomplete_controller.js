import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="movie-autocomplete"
export default class extends Controller {
  static targets = ["form", "input"]

  connect() {
    console.log("movie autocomplete controller connected")
  }

  search(event) {
    console.log(event);
    const inputValue = this.inputTarget.value
    console.log(inputValue)
  }
}
