import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal", "modalImgShell", "modalImg"];

  connect() {
  }

  openPdf(event) {
		this.modalTarget.classList.remove("d-none")
		this.modalImgShellTarget.innerHTML = "<svg xmlns='http://www.w3.org/2000/svg' class='close' viewBox='0 0 20 20' fill='currentColor' data-action='click->modal#close'><path fill-rule='evenodd' d='M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z' clip-rule='evenodd' /></svg><iframe src=\"#\" class=\"object-center object-cover sm:rounded-md h-full w-full\" data-modal-target=\"modalImg\">";
		this.modalImgTarget.src = event.currentTarget.src;
		console.log(event.currentTarget.src)
	 }

   open(event) {
		this.modalTarget.classList.remove("d-none");
	  this.modalImgShellTarget.innerHTML = "<svg xmlns='http://www.w3.org/2000/svg' class='close' viewBox='0 0 20 20' fill='currentColor' data-action='click->modal#close'><path fill-rule='evenodd' d='M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z' clip-rule='evenodd' /></svg><img src=\'#\' class=\'object-center object-cover sm:rounded-md\' data-modal-target=\'modalImg\' style='width: 700px;'>";
	  this.modalImgTarget.src = event.currentTarget.src;
		console.log(event.currentTarget.src)
	 }

   close() {
		this.modalTarget.classList.add("d-none");
	  this.modalImgShellTarget.removeChild(this.modalImgShellTarget.lastChild);
	}
}
