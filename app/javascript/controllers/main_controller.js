import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const menu = document.getElementById("mobile-nav")
    menu.classList.add("hidden")
  }
  click(e){
    const menu = document.getElementById("mobile-nav")
    menu.classList.toggle("block")
    menu.classList.toggle("hidden")
  }
}
