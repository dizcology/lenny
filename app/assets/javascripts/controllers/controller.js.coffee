Lenny.Controller = Marionette.Object.extend

	currentTab: ''

	# boilerplate!
	regionMapping:
		home: Lenny.Views.HomeView
		problems: Lenny.Views.ProblemsView
		practice: Lenny.Views.PracticeView

	home: ->
		@handleTab('home')

	handleTab: (tab) ->
		console.log tab
		@switchTo(tab)
		
	switchTo: (tab) ->
		if @currentTab != ''
			currentRegion = Lenny.getRegion Lenny.regionName @currentTab
			currentRegion.$el.hide()

		newRegion = Lenny.getRegion Lenny.regionName tab
		@currentTab = tab

		if newRegion.hasView()
			newRegion.$el.show()
		else
			newRegion.show new @regionMapping[tab]()
