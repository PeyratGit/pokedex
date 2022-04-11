import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "list", "searchInput", "checkboxInput"]
  update() {
    let url = "";
    if (/types/.test(window.location.href)) {
      url = `${window.location.href}&query=${this.searchInputTarget.value}`;
    } else {
      url = `${window.location.href}?query=${this.searchInputTarget.value}`;
    }
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data;
      })
  }
}
