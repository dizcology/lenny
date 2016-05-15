Lenny.ProblemsApp.ProblemEditView = Marionette.LayoutView.extend
	#tagName: 'ul'
	#className: 'nav nav-pills nav-stacked'
	template: JST['templates/problem_edit']

	regions:
		editableStatement: '#editable-statement'

	options:
		type: 'textarea'
		name: 'statement'

	onBeforeShow: ->
		@showChildView 'editableStatement', new Lenny.EditableView model: @model, options: @options
