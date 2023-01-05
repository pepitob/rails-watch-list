import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="movie-autocomplete"
export default class extends Controller {
  static targets = ["form", "input", "options"]

  connect() {
    this.optionsTarget.innerHTML = "";
  }

  search(event) {
    console.log(event);
    const inputValue = this.inputTarget.value
    const API_KEY = process.env.MOVIEDB_API_KEY;
    const url = `https://api.themoviedb.org/3/search/movie?api_key=${API_KEY}&query=${inputValue}`;
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        this.optionsTarget.innerHTML = "";
        data.results.slice(0, 5).forEach((movie) => {
          this.optionsTarget.insertAdjacentHTML("beforeend", `<li>${movie.title}</li>`);
        })
      })
  }

  select(event) {
    this.optionsTarget.innerHTML = "";
    this.inputTarget.value = event.target.innerHTML;

    if (this.optionsTarget.children.length === 0) {
      this.optionsTarget.classList.add('empty');
    } else {
      this.optionsTarget.classList.remove('empty');
    }
  }
}
