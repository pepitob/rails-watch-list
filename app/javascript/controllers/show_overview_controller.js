import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-overview"
export default class extends Controller {
  static targets = ["text", "card"]
  connect() {
    console.log("show overview connected")
  }
  show(event) {
    console.log(event);
    this.textTarget.classList.toggle('expanded');
    this.cardTarget.classList.toggle('expanded');
  }
}
