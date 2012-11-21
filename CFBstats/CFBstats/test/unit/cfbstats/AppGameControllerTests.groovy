package cfbstats



import org.junit.*
import grails.test.mixin.*

@TestFor(AppGameController)
@Mock(AppGame)
class AppGameControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/appGame/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.appGameInstanceList.size() == 0
        assert model.appGameInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.appGameInstance != null
    }

    void testSave() {
        controller.save()

        assert model.appGameInstance != null
        assert view == '/appGame/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/appGame/show/1'
        assert controller.flash.message != null
        assert AppGame.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/appGame/list'

        populateValidParams(params)
        def appGame = new AppGame(params)

        assert appGame.save() != null

        params.id = appGame.id

        def model = controller.show()

        assert model.appGameInstance == appGame
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/appGame/list'

        populateValidParams(params)
        def appGame = new AppGame(params)

        assert appGame.save() != null

        params.id = appGame.id

        def model = controller.edit()

        assert model.appGameInstance == appGame
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/appGame/list'

        response.reset()

        populateValidParams(params)
        def appGame = new AppGame(params)

        assert appGame.save() != null

        // test invalid parameters in update
        params.id = appGame.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/appGame/edit"
        assert model.appGameInstance != null

        appGame.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/appGame/show/$appGame.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        appGame.clearErrors()

        populateValidParams(params)
        params.id = appGame.id
        params.version = -1
        controller.update()

        assert view == "/appGame/edit"
        assert model.appGameInstance != null
        assert model.appGameInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/appGame/list'

        response.reset()

        populateValidParams(params)
        def appGame = new AppGame(params)

        assert appGame.save() != null
        assert AppGame.count() == 1

        params.id = appGame.id

        controller.delete()

        assert AppGame.count() == 0
        assert AppGame.get(appGame.id) == null
        assert response.redirectedUrl == '/appGame/list'
    }
}
