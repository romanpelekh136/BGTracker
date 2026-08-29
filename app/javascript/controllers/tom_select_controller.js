import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select"

export default class extends Controller {
  connect() {
    this.select = new TomSelect(this.element, {
      create: false,
      sortField: { field: "text", direction: "asc" },
      allowEmptyOption: true,
      placeholder: "Type to search..."
    })
  }

  disconnect() {
    if (this.select) {
      this.select.destroy()
    }
  }
}