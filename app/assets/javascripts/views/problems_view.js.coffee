Lenny.ProblemsApp.ProblemsView = Marionette.LayoutView.extend
	#tagName: 'ul'
	#className: 'nav nav-tabs'
	template: JST['templates/problems']

	regions:
		sidebar: '#sidebar'
		content: '#content'	

	collection: new Backbone.Collection([
			{content: 'hi', solution: 'wo'}
			{content: 'who is this? <script type="math/tex"> \\displaystyle\\int \\sum_0^\\infty</script>', solution: 'Herbie'}
		])
		

	onBeforeShow: ->
		@showChildView 'sidebar', new Lenny.ProblemsApp.ProblemListView {collection: @collection}

	onChildviewProblemItemClicked: (childview) ->
		console.log childview.model
		@showChildView 'content', new Lenny.ProblemsApp.ProblemEditView {model: childview.model}
