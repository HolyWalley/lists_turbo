import { Controller } from "stimulus"

import { debounce } from "lodash";

export default class extends Controller {
    static targets = [ "rule", "form", "public", "private" ]
    static values = { private: Boolean }

    connect() {
        this.switchMode()

        this.delayedSave = debounce(this.save, 1000);
    }

    toggle(event) {
        this.delayedSave()
    }

    save() {
        this.formTarget.requestSubmit()
    }

    toggleMode() {
        this.privateValue = !this.privateValue;
    }

    privateValueChanged() {
        this.switchMode();
    }

    switchMode() {
        if ( this.privateValue ) {
            this.privateTarget.classList.remove('hidden')
            this.publicTarget.classList.add('hidden')
        } else {
            this.privateTarget.classList.add('hidden')
            this.publicTarget.classList.remove('hidden')
        }
    }
}
