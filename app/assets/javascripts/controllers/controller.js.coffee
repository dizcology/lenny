Lenny.Controller = Marionette.Object.extend
	index: ->
		console.log 'index route'
		# placed in Lenny.Modules?
		#debugger
		Lenny.ProblemsApp.start()

	problems: ->
		console.log 'problems route'

	practice: ->
		console.log 'practice route'