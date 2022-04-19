import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  connect() {
    const task_form_modal = document.getElementById("task_form_modal")
    // task_form_modal.classList.add("hidden");
  }
  toggleForm(e){
    const task_form_modal = document.getElementById("task_form_modal")
    task_form_modal.classList.toggle("hidden");
  }
  close_modal(e){
    const close_button = document.getElementById("task_form_close")
    task_form_modal.classList.toggle("hidden");

  }
}
