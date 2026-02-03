import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [ "menu" ];

  toggle() {
    console.log("クリックされました！")
    this.menuTarget.classList.toggle("hidden");
  }

  disconnect() {
    window.removeEventListener("click", this.closeMenu)
  }
}
