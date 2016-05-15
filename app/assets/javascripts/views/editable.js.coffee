Lenny.EditableView = Marionette.ItemView.extend
	#tagName: 'ul'
	#className: 'nav nav-pills nav-stacked'
	template: JST['templates/editable']

	ui:
		'previewSelector': '#preview-selector'
		'editSelector': '#edit-selector'

	events:
		'click @ui.previewSelector': 'edit'
		'blur @ui.editSelector': 'finishEdit'

	edit: (ev)->
		console.log 'trying to edit'
		type = @options.options.type
		wrapper = '<' + type + '></' + type + '>'

		@ui.previewSelector.html ''
		$(wrapper)
			.attr({
				'id': 'edit-selector'
				'class': 'form-control'
				'style': 'resize:none'
				'rows': 10
			})
			.val(@model.attributes.content)
			.appendTo(@ui.previewSelector)
		$('#edit-selector').focus()

	finishEdit: ->
		console.log 'finished editing statement'
		# TODO: update model by ajax
		newContent = $('#edit-selector').val()
		@model.set 'content': newContent
		@ui.previewSelector.html newContent