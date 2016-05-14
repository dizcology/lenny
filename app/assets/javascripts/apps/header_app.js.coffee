Lenny.module "HeaderApp", (HeaderApp, Lenny, Backbone, Marionette, $, _) ->
	API =
		showHeader: ->
			HeaderApp.Controller.showHeader()

	HeaderApp.on "start", ->
		API.showHeader()
