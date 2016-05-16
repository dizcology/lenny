Lenny.EditableView = Marionette.LayoutView.extend
	#tagName: 'ul'
	#className: 'nav nav-pills nav-stacked'
	template: JST['templates/editable']

	previewId: 'preview-region'
	editId: 'edit-selector'
	ui:
		'previewSelector': '#preview-region'
		'editSelector': '#edit-selector'

	events:
		'click @ui.previewSelector': 'edit'
		'blur @ui.editSelector': 'finishEdit'

	regions:
		previewRegion: '#preview-region'

	initialize: (options) ->
		@args = options.args

	onBeforeShow: ->
		@renderPreview()

	renderPreview: ->
		@showChildView 'previewRegion', new Lenny.MathJaxView model: @model, args: @args

	edit: (ev) ->
		console.log 'trying to edit'
		type = @args.type
		wrapper = '<' + type + '></' + type + '>'

		@previewRegion.empty()
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
		@renderPreview()


