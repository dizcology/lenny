Lenny.Views.ProblemListView = Marionette.CompositeView.extend
	tagName: 'ul'
	className: 'nav nav-pills nav-stacked'
	template: JST['templates/problem_list']

	childView: Lenny.Views.ProblemItemView

	onChildviewProblemItemClicked: (childview) ->
		console.log childview.model.attributes.content