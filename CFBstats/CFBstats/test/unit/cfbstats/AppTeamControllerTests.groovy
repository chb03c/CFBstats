package cfbstats



import org.junit.*
import grails.test.mixin.*

@TestFor(AppTeamController)
@Mock(AppTeam)
class AppTeamControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/appTeam/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.appTeamInstanceList.size() == 0
        assert model.appTeamInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.appTeamInstance != null
    }

    void testSave() {
        controller.save()

        assert model.appTeamInstance != null
        assert view == '/appTeam/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/appTeam/show/1'
        assert controller.flash.message != null
        assert AppTeam.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/appTeam/list'

        populateValidParams(params)
        def appTeam = new AppTeam(params)

        assert appTeam.save() != null

        params.id = appTeam.id

        def model = controller.show()

        assert model.appTeamInstance == appTeam
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/appTeam/list'

        populateValidParams(params)
        def appTeam = new AppTeam(params)

        assert appTeam.save() != null

        params.id = appTeam.id

        def model = controller.edit()

        assert model.appTeamInstance == appTeam
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/appTeam/list'

        response.reset()

        populateValidParams(params)
        def appTeam = new AppTeam(params)

        assert appTeam.save() != null

        // test invalid parameters in update
        params.id = appTeam.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/appTeam/edit"
        assert model.appTeamInstance != null

        appTeam.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/appTeam/show/$appTeam.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        appTeam.clearErrors()

        populateValidParams(params)
        params.id = appTeam.id
        params.version = -1
        controller.update()

        assert view == "/appTeam/edit"
        assert model.appTeamInstance != null
        assert model.appTeamInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/appTeam/list'

        response.reset()

        populateValidParams(params)
        def appTeam = new AppTeam(params)

        assert appTeam.save() != null
        assert AppTeam.count() == 1

        params.id = appTeam.id

        controller.delete()

        assert AppTeam.count() == 0
        assert AppTeam.get(appTeam.id) == null
        assert response.redirectedUrl == '/appTeam/list'
    }
}
