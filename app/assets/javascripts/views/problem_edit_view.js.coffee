Lenny.Views.ProblemEditView = Marionette.LayoutView.extend
	#tagName: 'ul'
	#className: 'nav nav-pills nav-stacked'
	template: JST['templates/problem_edit']

	regions:
		editableStatement: '#editable-statement'

	editableArgs:
		type: 'textarea'
		name: 'statement'

	onBeforeShow: ->
		#debugger
		@showChildView 'editableStatement', new Lenny.EditableView model: @model, args: @editableArgs
