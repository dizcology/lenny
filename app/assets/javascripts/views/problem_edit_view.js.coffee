Lenny.Views.ProblemEditView = Marionette.LayoutView.extend
	#tagName: 'ul'
	#className: 'nav nav-pills nav-stacked'
	template: JST['templates/problem_edit']

	regions:
		editableStatement: '#editable-statement'
		previewSolutions: '#preview-solutions'

	editableArgs:
		type: 'textarea'
		name: 'statement'

	ui:
		'saveButton': '#save'

	triggers:
		'click @ui.saveButton': 'problem:save:clicked'

	onProblemSaveClicked: ->
		@model.save null,
			success: (model, response) ->
	          console.log 'success!'
	          #debugger
	        error: (model, xhr, options) ->
	          console.log 'error!'

	render: ->
		@$el.html @template @model

	onBeforeShow: ->
		#debugger
		@showChildView 'editableStatement', new Lenny.EditableView model: @model, args: @editableArgs
		@showChildView 'previewSolutions', new Lenny.Views.SolutionsView collection: @model.solutions
