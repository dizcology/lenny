Lenny.Views.ProblemItemView = Marionette.ItemView.extend
	tagName: 'li'
	template: JST['templates/problem_item']

	#initialize: ->
	#	debugger

	ui:
		'problemItem': 'a'

	triggers:
		'click @ui.problemItem': 'problem:item:clicked'

	onProblemItemClicked: ->
		#console.log 'clicked!!' + @model.attributes.content