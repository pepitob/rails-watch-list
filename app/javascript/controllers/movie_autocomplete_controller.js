import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="movie-autocomplete"
export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("movie autocomplete controller connected")
  }
}
