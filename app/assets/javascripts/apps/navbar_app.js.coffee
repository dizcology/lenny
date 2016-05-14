Lenny.module "NavbarApp", (NavbarApp, Lenny, Backbone, Marionette, $, _) ->
	API =
		showNavbar: ->
			NavbarApp.Controller.showNavbar()

	NavbarApp.on "start", ->
		API.showNavbar()
