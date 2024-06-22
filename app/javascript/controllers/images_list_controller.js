import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="images-list"
export default class extends Controller {
  connect() {
    console.log('I am connecting!!!')
  }

  initialize() {
    this.element.setAttribute("data-action", "click->images-list#load_all_images");
  }

  load_all_images(event){
    event.preventDefault();
    this.url = this.element.getAttribute('href')
    fetch(this.url, {
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
    .then(response => response.text())
    .then(html => Turbo.renderStreamMessage(html))
  }
}
