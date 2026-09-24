import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="adjuster"
export default class extends Controller {
  static targets = ["quantity"]
  connect() {
    console.log("Hello from adjuster controller")
  }

  add(event) {
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    const inventoryId = this.element.dataset.inventoryId
    const url = `/inventories/${inventoryId}/adjust`
    console.log("Fetching URL:", url)   // <-- add this
    console.log("inventoryId is:", inventoryId)  // <-- and this
    fetch(url, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "X-CSRF-Token": token
      },
      body: JSON.stringify({ adjustment_amount: 5 })
    })
    .then(response => {
      if(response.ok) {
        const current = parseInt(this.quantityTarget.textContent)
        this.quantityTarget.textContent = `${current + 5} units`
      }else{
        console.log("Server rejected the update.")
      }
    })
  }
}
