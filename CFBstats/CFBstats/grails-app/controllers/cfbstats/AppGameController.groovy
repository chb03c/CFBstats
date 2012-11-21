package cfbstats

import org.springframework.dao.DataIntegrityViolationException

class AppGameController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [appGameInstanceList: AppGame.list(params), appGameInstanceTotal: AppGame.count()]
    }

    def create() {
        [appGameInstance: new AppGame(params)]
    }

    def save() {
        def appGameInstance = new AppGame(params)
        if (!appGameInstance.save(flush: true)) {
            render(view: "create", model: [appGameInstance: appGameInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'appGame.label', default: 'AppGame'), appGameInstance.id])
        redirect(action: "show", id: appGameInstance.id)
    }

    def show(Long id) {
        def appGameInstance = AppGame.get(id)
        if (!appGameInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'appGame.label', default: 'AppGame'), id])
            redirect(action: "list")
            return
        }

        [appGameInstance: appGameInstance]
    }

    def edit(Long id) {
        def appGameInstance = AppGame.get(id)
        if (!appGameInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'appGame.label', default: 'AppGame'), id])
            redirect(action: "list")
            return
        }

        [appGameInstance: appGameInstance]
    }

    def update(Long id, Long version) {
        def appGameInstance = AppGame.get(id)
        if (!appGameInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'appGame.label', default: 'AppGame'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (appGameInstance.version > version) {
                appGameInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'appGame.label', default: 'AppGame')] as Object[],
                          "Another user has updated this AppGame while you were editing")
                render(view: "edit", model: [appGameInstance: appGameInstance])
                return
            }
        }

        appGameInstance.properties = params

        if (!appGameInstance.save(flush: true)) {
            render(view: "edit", model: [appGameInstance: appGameInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'appGame.label', default: 'AppGame'), appGameInstance.id])
        redirect(action: "show", id: appGameInstance.id)
    }

    def delete(Long id) {
        def appGameInstance = AppGame.get(id)
        if (!appGameInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'appGame.label', default: 'AppGame'), id])
            redirect(action: "list")
            return
        }

        try {
            appGameInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'appGame.label', default: 'AppGame'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'appGame.label', default: 'AppGame'), id])
            redirect(action: "show", id: id)
        }
    }
}
