Lenny.Controller = Marionette.Object.extend

	currentTab: ''

	# boilerplate!
	regionMapping:
		problems: Lenny.Views.ProblemsView
		home: Lenny.Views.HomeView

	home: ->
		@handleTab('home')

	index: ->
		console.log 'index route'
		# placed in Lenny.Modules?
		#debugger
		#Lenny.ProblemsApp.start()
		#problems = new Lenny.Collections.Problem
		#Lenny.mainRegion.show new Lenny.Views.ProblemsView(collection: problems)
		#Lenny.mainRegion.show new Lenny.Views.ProblemsView()
		#problems.fetch()
		#Lenny.mainRegion.$el.show()
		#debugger

	problems: ->
		console.log 'problems route'
		#debugger
		#Lenny.ProblemsApp.start()
		Lenny.mainRegion.show new Lenny.Views.ProblemsView()

	practice: ->
		console.log 'practice route'
		#Lenny.ProblemsApp.stop()
		Lenny.mainRegion.$el.hide()

	handleTab: (tab) ->
		console.log tab
		#debugger
		@switchTo(tab)
		
	switchTo: (tab) ->
		if @currentTab != ''
			currentRegion = Lenny.getRegion @regionName @currentTab
			currentRegion.$el.hide()

		#debugger
		newRegion = Lenny.getRegion @regionName tab
		@currentTab = tab

		if newRegion.hasView()
			newRegion.$el.show()
		else
			newRegion.show new @regionMapping[tab]()


	regionName: (tab) ->
		tab + 'Region'
