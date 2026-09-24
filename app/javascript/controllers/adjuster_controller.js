import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="adjuster"
export default class extends Controller {
  static targets = ["quantity"]
  connect() {
    console.log("Hello from adjuster controller")
  }

  add() {
    const current = parseInt(this.quantityTarget.textContent)
    this.quantityTarget.textContent = `${current + 5} units`
  }
}
