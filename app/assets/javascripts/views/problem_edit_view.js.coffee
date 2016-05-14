Lenny.ProblemsApp.ProblemEditView = Marionette.ItemView.extend
	#tagName: 'ul'
	#className: 'nav nav-pills nav-stacked'
	template: JST['templates/problem_edit']

	ui:
		'previewStatement': '#preview-statement'
		'editStatement': '#edit-statement'

	events:
		'click @ui.previewStatement': 'editStatement'
		'blur @ui.editStatement': 'finishEditStatement'

	editStatement: (ev)->
		#debugger
		console.log 'trying to edit problem statement'
		console.log arg
		@ui.previewStatement.html ''
		$('<textarea></textarea>')
			.attr({
				'id': 'edit-statement'
				'class': 'form-control'
				'style': 'resize:none'
				'rows': 10
			})
			.val(@model.attributes.statement)
			.appendTo(@ui.previewStatement)
		$('#edit-statement').focus()

	finishEditStatement: ->
		console.log 'finished editing statement'
		# TODO: update model
		newStatement = $('#edit-statement').val()
		@model.set 'statement': newStatement
		@ui.previewStatement.html newStatement


