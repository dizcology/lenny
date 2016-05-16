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
		'keyup #edit-selector': 'editUpdated'

	regions:
		previewRegion: '#preview-region'

	initialize: (options) ->
		@args = options.args

	onBeforeShow: ->
		@renderPreview()

	renderPreview: ->
		@showChildView 'previewRegion', new Lenny.MathJaxView model: @model, args: @args

	editUpdated: ->
		newContent = $('#' + @editId).val()
		@model.set 'content': newContent
		@editPopover.currentView.renderMathJax()

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
				'data-toggle': 'popover'
				'data-placement': 'top'
				'title': 'Preview'
				'data-content': '<div id="edit-popover"></div>'
				'data-trigger': 'focus'
			})
			.val(@model.attributes.content)
			.insertAfter(@ui.previewSelector)
		$('#' + @editId).popover
			html:true
		$('#' + @editId).focus()
		
		@addRegion('editPopover', '#edit-popover')

		popoverArgs =
			name: 'popover'

		@showChildView 'editPopover', new Lenny.MathJaxView model: @model, args: popoverArgs

	finishEdit: ->
		console.log 'finished editing statement'
		# TODO: update model by ajax
		@editUpdated()
		$('#' + @editId).remove()
		@renderPreview()


