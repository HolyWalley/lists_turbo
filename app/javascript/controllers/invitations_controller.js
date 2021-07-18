import { Controller } from "stimulus"

export default class extends Controller {
    connect() {
        const validToken = document.head.querySelector("[name=csrf-token]").content
        this.element.querySelector("[name=authenticity_token]").value = validToken
    }

    create( event ) {
        event.preventDefault();
        event.stopPropagation();

        event.target.submit();
        event.target.reset();
    }

    update( event ) {
        event.preventDefault();
        event.stopPropagation();

        if ( event.target.nodeName === "FORM" ) {
            document.activeElement.blur()
            return
        }

        event.target.form.submit()
    }
}
