import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    setTimeout(() => {
      this.dismiss();
    }, 3000);
  }

  dismiss() {
    this.element.classList.add(
      "opacity-0",
      "transition-all",
      "duration-1000",
      "-translate-y-10",
    );

    setTimeout(() => {
      (this.element, remove());
    }, 1000);
  }
}
