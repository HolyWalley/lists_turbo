import { Controller } from "stimulus"

export default class extends Controller {
    static values = { isCopied: Boolean }
    static targets = [ "source" ]

    copy(event) {
        event.preventDefault()
        event.stopPropagation()

        this.sourceTarget.select()
        document.execCommand("copy")

        this.isCopiedValue = true
    }
}
