Lenny.ProblemsApp.Controller = 
	showProblems: ->
		console.log 'problems controller show'
		problemsView = @getProblemsView()
		Lenny.moduleRegion.show problemsView

	getProblemsView: ->
		new Lenny.ProblemsApp.ProblemsView()