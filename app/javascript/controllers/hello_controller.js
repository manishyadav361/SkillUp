import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("hii");
  }
  click(e){
    const menu = document.getElementById("mobile-nav")
    menu.classList.toggle("block")
    menu.classList.toggle("hidden")
  }
}
