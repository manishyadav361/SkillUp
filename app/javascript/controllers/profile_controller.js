import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
    toggle_profile_form(){
        const form = document.getElementById("profile_form")
        form.classList.toggle("hidden")
        form.classList.toggle("block")

    }
}