Lenny.NavbarApp.TabView = Marionette.ItemView.extend
	tagName: 'li'
	template: JST["templates/tab"]
	
	events:
	    "click a": "clicked"

	clicked: ->
		Lenny.router.navigate(@model.attributes.url, { trigger: true, replace: true })

