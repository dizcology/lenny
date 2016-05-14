Lenny.HeaderApp.Controller = 
	showHeader: ->
		headerView = @getHeaderView()
		Lenny.headerRegion.show headerView
	
	getHeaderView: ->
		new Lenny.HeaderApp.HeaderView()