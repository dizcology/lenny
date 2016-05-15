Lenny.ProblemsApp.ProblemsView = Marionette.LayoutView.extend
	#tagName: 'ul'
	#className: 'nav nav-tabs'
	template: JST['templates/problems']

	regions:
		sidebar: '#sidebar'
		content: '#content'	

	collection: new Backbone.Collection([
			{content: 'hi', solution: 'wo'}
			{content: 'who is this?', solution: 'Herbie'}
		])

	baseModel: new Backbone.Model(
			{content: 'what is $1 + 1$?', solution: '234'}
		)
		

	onBeforeShow: ->
		@showChildView 'sidebar', new Lenny.ProblemsApp.ProblemListView {collection: @collection}
		@showChildView 'content', new Lenny.ProblemsApp.ProblemEditView {model: @baseModel}
