import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "list", "searchInput", "checkboxInput", "hiddenInputTypes"];
  update() {
    let url = window.location.href;
    if (/types/.test(url)) {
      url = `${url}&query=${this.searchInputTarget.value}`;
    } else if (/query/.test(url)) {
      url = `${url}${this.searchInputTarget.value}`;
    }
    else {
      url = `${url}?query=${this.searchInputTarget.value}`;
    }
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data;
      })
  }
}
