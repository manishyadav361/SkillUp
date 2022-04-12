// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

    const menu = document.querySelector("#mobile-nav")
    const btn = document.querySelector("#toggle")
    btn.addEventListener("click",  () => {
        
        menu.classList.toggle("block")
        menu.classList.toggle("hidden")
        
    })
