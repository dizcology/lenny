Lenny.ProblemsApp.ProblemsView = Marionette.LayoutView.extend
	#tagName: 'ul'
	#className: 'nav nav-tabs'
	template: JST['templates/problems']

	regions:
		sidebar: '#sidebar'
		content: '#content'	

	collection: new Backbone.Collection([
			{statement: 'what is 1 + 1?', solution: '234'}
			{statement: 'who is this?', solution: 'Herbie'}
		])

	baseModel: new Backbone.Model(
			{statement: 'hi', solution: 'wo'}
		)
		

	onBeforeShow: ->
		@showChildView 'sidebar', new Lenny.ProblemsApp.ProblemListView {collection: @collection}
		@showChildView 'content', new Lenny.ProblemsApp.ProblemEditView {model: @baseModel}
