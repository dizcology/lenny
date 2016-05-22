Lenny.Views.ProblemsView = Marionette.LayoutView.extend
	#tagName: 'ul'
	#className: 'nav nav-tabs'
	template: JST['templates/problems']

	regions:
		sidebar: '#sidebar'
		content: '#content'	

	initialize: ->
		@collection = new Lenny.Collections.Problem
		@collection.fetch()	

	onBeforeShow: ->
		@showChildView 'sidebar', new Lenny.Views.ProblemListView {collection: @collection}

	onChildviewProblemItemClicked: (childview) ->
		console.log childview.model
		@showChildView 'content', new Lenny.Views.ProblemEditView {model: childview.model}
