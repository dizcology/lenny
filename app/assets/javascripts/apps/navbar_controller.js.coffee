Lenny.NavbarApp.Controller = 
	showNavbar: ->
		navbarView = @getNavbarView()
		Lenny.navbarRegion.show navbarView
	
	getNavbarView: ->
		new Lenny.NavbarApp.NavbarView()