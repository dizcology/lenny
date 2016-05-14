Lenny.NavbarApp.NavbarView = Marionette.CollectionView.extend
	tagName: 'ul'
	className: 'nav nav-tabs'
	#childView: Lenny.TabView

	collection: new Backbone.Collection([
			{name: 'Home', url: ''}
			{name: 'Problems', url: 'problems'}
			{name: 'Practice', url: 'practice'}
		])

	getChildView: (tab) ->
		return Lenny.NavbarApp.TabView
