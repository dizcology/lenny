Lenny.ProblemsApp.ProblemListView = Marionette.CompositeView.extend
	tagName: 'ul'
	className: 'nav nav-pills nav-stacked'
	template: JST['templates/problem_list']

	#getChildView: (problem) ->
	#	return Lenny.ProblemsApp.ProblemItemView

	childView: Lenny.ProblemsApp.ProblemItemView

	onChildviewProblemItemClicked: (childview) ->
		console.log childview.model.attributes.content