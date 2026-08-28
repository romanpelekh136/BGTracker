import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="nested-form"
export default class extends Controller {
  static targets = ["template", "links"]

  
  add(event) {
    event.preventDefault()
    
    let content = this.templateTarget.innerHTML
    let newId = new Date().getTime()

    content = content.replace(/NEW_RECORD/g, newId)

    this.linksTarget.insertAdjacentHTML('beforebegin', content)
  }
}
