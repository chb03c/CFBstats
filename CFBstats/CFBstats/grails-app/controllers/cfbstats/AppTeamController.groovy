package cfbstats

import org.springframework.dao.DataIntegrityViolationException

class AppTeamController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def importTeamData(){
        
    }

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [appTeamInstanceList: AppTeam.list(params), appTeamInstanceTotal: AppTeam.count()]
    }

    def create() {
        [appTeamInstance: new AppTeam(params)]
    }

    def save() {
        def appTeamInstance = new AppTeam(params)
        if (!appTeamInstance.save(flush: true)) {
            render(view: "create", model: [appTeamInstance: appTeamInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'appTeam.label', default: 'AppTeam'), appTeamInstance.id])
        redirect(action: "show", id: appTeamInstance.id)
    }

    def show(Long id) {
        def appTeamInstance = AppTeam.get(id)
        if (!appTeamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'appTeam.label', default: 'AppTeam'), id])
            redirect(action: "list")
            return
        }

        [appTeamInstance: appTeamInstance]
    }

    def edit(Long id) {
        def appTeamInstance = AppTeam.get(id)
        if (!appTeamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'appTeam.label', default: 'AppTeam'), id])
            redirect(action: "list")
            return
        }

        [appTeamInstance: appTeamInstance]
    }

    def update(Long id, Long version) {
        def appTeamInstance = AppTeam.get(id)
        if (!appTeamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'appTeam.label', default: 'AppTeam'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (appTeamInstance.version > version) {
                appTeamInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'appTeam.label', default: 'AppTeam')] as Object[],
                          "Another user has updated this AppTeam while you were editing")
                render(view: "edit", model: [appTeamInstance: appTeamInstance])
                return
            }
        }

        appTeamInstance.properties = params

        if (!appTeamInstance.save(flush: true)) {
            render(view: "edit", model: [appTeamInstance: appTeamInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'appTeam.label', default: 'AppTeam'), appTeamInstance.id])
        redirect(action: "show", id: appTeamInstance.id)
    }

    def delete(Long id) {
        def appTeamInstance = AppTeam.get(id)
        if (!appTeamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'appTeam.label', default: 'AppTeam'), id])
            redirect(action: "list")
            return
        }

        try {
            appTeamInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'appTeam.label', default: 'AppTeam'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'appTeam.label', default: 'AppTeam'), id])
            redirect(action: "show", id: id)
        }
    }
}
