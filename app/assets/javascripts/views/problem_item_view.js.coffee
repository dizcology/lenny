Lenny.Views.ProblemItemView = Marionette.LayoutView.extend
	tagName: 'li'
	template: JST['templates/problem_item']

	initialize: ->
		#debugger
		#debugger
		#console.log @model.id
		@model.dataId = "tooltip" + @model.id
		#@model.tooltip = ''
		#@model.tooltip = "Preview:<div id='" + @model.dataId + "'></div>"
		#debugger
		#@addRegion('tooltipView', '#' + @tooltipSelector)
		@url = 'problems/' + @model.id
		@

	render: ->
		@$el.html @template @model
		@activateTooltip()

		#debugger

	activateTooltip: ->
    	@$el.find('[rel=tooltip]').tooltip()
    	#@$el.children('[rel=tooltip]').on 'shown.bs.tooltip', () ->
    		#console.log 'tooltip shown'
    		#console.log this.dataset.id
    		#console.log $('#' + this.dataset.id)
    		#debugger

	ui:
		'problemItem': 'a'
		'problemId': '#problemId'

	triggers:
		'click @ui.problemItem': 'problem:item:clicked'
		'mouseover @ui.problemId': 'problem:id:mouseover'

	onProblemIdMouseover: ->
		#console.log 'mouseover'
		#@activateTooltip()
		#debugger

		#@model.tooltip = "<div id='" + @model.dataId + "'></div>"

		#@$el.children('[rel=tooltip]').tooltip('hide')
		@addRegion('tooltipPreview', '#' + @model.dataId)

		tooltipArgs =
			name: 'tooltip'

		#@$el.children('[rel=tooltip]').tooltip('hide')

		@showChildView 'tooltipPreview', new Lenny.MathJaxView model: @model, args: tooltipArgs
		#debugger

		#@$el.children('[rel=tooltip]').tooltip('show')

	onProblemItemClicked: ->
		#debugger
		#console.log 'clicked!!' + @model.attributes.content