Lenny.EditableView = Marionette.ItemView.extend
	#tagName: 'ul'
	#className: 'nav nav-pills nav-stacked'
	template: JST['templates/editable']

	previewId: 'preview-selector'
	editId: 'edit-selector'
	ui:
		'previewSelector': '#preview-selector'
		'editSelector': '#edit-selector'

	events:
		'click @ui.previewSelector': 'edit'
		'blur @ui.editSelector': 'finishEdit'

	onRender: ->
		@ui.previewSelector.html @model.attributes.content
		@renderMathJax()

	edit: (ev) ->
		console.log 'trying to edit'
		type = @options.options.type
		wrapper = '<' + type + '></' + type + '>'

		@ui.previewSelector.html ''
		$(wrapper)
			.attr({
				'id': @editId
				'class': 'form-control'
				'style': 'resize:none'
				'rows': 10
			})
			.val(@model.attributes.content)
			.insertAfter(@ui.previewSelector)
		$('#' + @editId).focus()

	finishEdit: ->
		console.log 'finished editing statement'
		# TODO: update model by ajax
		newContent = $('#' + @editId).val()
		$('#' + @editId).remove()
		console.log newContent
		@model.set 'content': newContent
		@ui.previewSelector.html newContent
		@renderMathJax()

	onShow: ->
		@renderMathJax()

	renderMathJax: ->
		console.log 'queueing to render MathJax'
		MathJax.Hub.Queue ["Typeset", MathJax.Hub, @previewId]

