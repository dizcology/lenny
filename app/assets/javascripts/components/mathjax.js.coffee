Lenny.MathJaxView = Marionette.ItemView.extend
	template: JST['templates/mathjax']

	initialize: (options)->
		@args = options.args
		@$el.attr('id', @args.name + '-mathjax-content')
		#@listenTo(@model, 'change', @render)

	onRender: ->
		#console.log 'rendering'
		@renderMathJax()

	renderMathJax: ->
		
		_selector = '#' + @args.name + '-mathjax-content'
		@model.set mathjaxContent: @contentToMathjax @model.attributes.content

		@$el.hide()
		@$el.html @model.attributes.mathjaxContent

		MathJax.Hub.Queue ["Typeset", MathJax.Hub, @el]
		MathJax.Hub.Queue () -> $(_selector).show()

	contentToMathjax: (content) ->
		result = ''
		len = content.length
		mathFlag = false
		for i in [0..len] by 1
			c = content.charAt i
			if c == '$'
				mathFlag = ! mathFlag
				if mathFlag
					result += '<script type="math/tex">'
				else
					result += '</script>'
			else
				result += c

		result

