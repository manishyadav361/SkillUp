import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    

  }
  add_skill_form(){
    const skill_form = document.getElementById("skill_form")
    skill_form.classList.toggle("hidden")
    skill_form.classList.toggle("block")
  }
}