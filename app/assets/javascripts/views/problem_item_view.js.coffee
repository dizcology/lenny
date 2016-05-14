Lenny.ProblemsApp.ProblemItemView = Marionette.ItemView.extend
	tagName: 'li'
	template: JST['templates/problem_item']

	ui:
		'problemItem': 'a'

	triggers:
		'click @ui.problemItem': 'problem:item:clicked'

	events:
		'click @ui.problemItem': 'itemClicked'

	itemClicked: ->
		# this is not called!
		console.log 'clicked!!' + @model.attributes.statement