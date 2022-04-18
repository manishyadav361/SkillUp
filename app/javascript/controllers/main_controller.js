import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const menu = document.getElementById("mobile-nav")
    menu.classList.toggle("block")

  }
  click(e){
    const menu = document.getElementById("mobile-nav")
    menu.classList.toggle("block")
    menu.classList.toggle("hidden")

  }
  navigate_to_profile(e){
    const user_id = this.data.get("userId") 
    window.location.assign(`/profile/${user_id}`)
  }
  task_navigate(e){
    const task_id = this.data.get("taskId") 
    window.location.assign(`/tasks/${task_id}`)
  }
  show_post_comments(e){
    window.location.assign(`/posts/${this.data.get("postId")}`)
  }
  add_skill_form(){
    const skill_form = document.getElementById("skill_form")
    const cancel = document.getElementById("cancel_form")
    const add = document.getElementById("add_form")
    add.classList.toggle("hidden")
    add.classList.toggle("block")

    cancel.classList.toggle("hidden")
    cancel.classList.toggle("block")

    skill_form.classList.toggle("hidden")
    skill_form.classList.toggle("block")
  }
}
