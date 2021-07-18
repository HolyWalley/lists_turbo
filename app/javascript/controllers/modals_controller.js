import { Controller } from "stimulus"

export default class extends Controller {
    static values = { shown: Boolean }

    close(event) {
        event.preventDefault();
        event.stopPropagation();

        this.shownValue = false;
    }

    open(event) {
        event.preventDefault();
        event.stopPropagation();

        this.shownValue = true;
    }
}
