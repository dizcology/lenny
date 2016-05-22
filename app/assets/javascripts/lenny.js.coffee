@Lenny = new Marionette.Application

Lenny.module 'Models'
Lenny.module 'Collections'
Lenny.module 'Views'
Lenny.module 'Modules'

Lenny.regionName = (key) ->
	key + 'Region'

Lenny.regionSelector = (key) ->
	'#' + key + '-region'

Lenny.addInitializer ->
	regionKeys = ['header', 'navbar', 'home', 'problems', 'practice', 'footer']

	hash = {}
	for key in regionKeys
		rName = Lenny.regionName key
		rSelector = Lenny.regionSelector key
		hash[rName] = rSelector

	Lenny.addRegions hash

	Lenny.controller = new Lenny.Controller
	Lenny.router = new Lenny.Router(controller: Lenny.controller)

	Backbone.history.start(pushState: true)

$ ->
	Lenny.start()