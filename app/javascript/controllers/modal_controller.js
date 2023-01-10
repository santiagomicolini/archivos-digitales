import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal", "modalImgShell", "modalImg"];

  connect() {
  }

  openPdf(event) {
		this.modalTarget.classList.remove("d-none")
		const docs = []
		// console.log(typeof(JSON.parse(event.currentTarget.dataset.images)))
		JSON.parse(event.currentTarget.dataset.images).slice(1).forEach((img) => {
			docs.push(`<div class="carousel-item">
				<img src="${img}" class="d-block w-100" alt="...">
			</div>`)
		})
		// console.log(docs.slice(1))

		// this.modalImgShellTarget.innerHTML = "<svg xmlns='http://www.w3.org/2000/svg' class='close' viewBox='0 0 20 20' fill='currentColor' data-action='click->modal#close'><path fill-rule='evenodd' d='M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z' clip-rule='evenodd' /></svg><iframe src=\"#\" class=\"object-center object-cover sm:rounded-md h-full w-full\" data-modal-target=\"modalImg\">";
		this.modalImgShellTarget.innerHTML = `<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="${JSON.parse(event.currentTarget.dataset.images)[0]}" class="d-block w-100" alt="...">
				</div>
				${docs.slice(0, -1)}
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>`
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
