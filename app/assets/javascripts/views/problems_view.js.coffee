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

	onChildviewProblemCreateClicked: (childview) ->
		console.log "trying to create a problem"
		newProblem = new Lenny.Models.Problem
			content: "Click to edit the problem content."
		@collection.add newProblem
		@showChildView 'content', new Lenny.Views.ProblemEditView {model: newProblem}

	onChildviewProblemItemClicked: (childview) ->
		#console.log childview.model
		@showChildView 'content', new Lenny.Views.ProblemEditView {model: childview.model}
