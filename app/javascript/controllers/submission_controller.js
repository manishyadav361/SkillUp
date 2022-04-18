import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    toggle_submission_form(){
        const sub_form = document.getElementById("submission_form")

        sub_form.classList.toggle("hidden")
        sub_form.classList.toggle("block")

    }
}