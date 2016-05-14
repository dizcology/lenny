Lenny.module "ProblemsApp", (ProblemsApp, Lenny, Backbone, Marionette, $, _) ->
	@startWithParent = false
	API =
		showProblems: ->
			console.log 'show problems'
			ProblemsApp.Controller.showProblems()

	ProblemsApp.on "start", ->
		API.showProblems()
