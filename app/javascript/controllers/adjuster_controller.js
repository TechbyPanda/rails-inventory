import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="adjuster"
export default class extends Controller {
  connect() {
    console.log("Hello from adjuster controller")
  }
}
