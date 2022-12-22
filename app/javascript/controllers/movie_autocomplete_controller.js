import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="movie-autocomplete"
export default class extends Controller {
  connect() {
    console.log("movie autocomplete controller connected")
  }
}
