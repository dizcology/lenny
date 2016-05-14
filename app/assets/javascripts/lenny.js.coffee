@Lenny = new Marionette.Application

Lenny.module 'Models'
Lenny.module 'Collections'
Lenny.module 'Views'
Lenny.module 'Modules'

Lenny.addInitializer ->
	Lenny.addRegions
		headerRegion: '#header-region'
		navbarRegion: '#navbar-region'
		moduleRegion: '#module-region'
		footerRegion: '#footer-region'

	Lenny.controller = new Lenny.Controller
	Lenny.router = new Lenny.Router(controller: Lenny.controller)

	Backbone.history.start(pushState: true)

$ ->
	Lenny.start()