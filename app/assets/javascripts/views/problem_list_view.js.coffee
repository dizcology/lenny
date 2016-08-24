Lenny.Views.ProblemListView = Marionette.CompositeView.extend
	tagName: 'ul'
	className: 'nav nav-pills nav-stacked'
	template: JST['templates/problem_list']

	childView: Lenny.Views.ProblemItemView
	
	#buildChildView: (child, ChildViewClass, childViewOptions) ->
	#	new ChildViewClass {model: child}

	ui:
		'createButton': '#create'

	triggers:
		'click @ui.createButton': 'problem:create:clicked'

	onProblemCreateClicked: ->
		#console.log 'clicked!!'

	onChildviewProblemItemClicked: (childview) ->
		#console.log childview.model.attributes.content