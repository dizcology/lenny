Lenny.MathJaxView = Marionette.ItemView.extend
	template: JST['templates/mathjax']

	initialize: (options)->
		@args = options.args
		@$el.attr('id', @args.name + '-mathjax-content')

	onRender: ->
		#console.log 'rendering'
		@renderMathJax()


	renderMathJax: ->
		
		_selector = '#' + @args.name + '-mathjax-content'
		@model.set mathjaxContent: @contentToMathjax @model.attributes.content

		@$el.hide()
		@$el.html @model.attributes.mathjaxContent

		MathJax.Hub.Queue ["Typeset", MathJax.Hub, @el], -> $(_selector).show()

	contentToMathjax: (content) ->
		result = ''
		len = content.length
		mathFlag = false
		inputFlag = false
		mathContent = ''
		inputContent = ''

		for i in [0..len] by 1
			c = content.charAt i
			if c == '$'
				mathFlag = ! mathFlag
				if not mathFlag
					result += @mathTemplate mathContent
					mathContent = ''

			else if mathFlag
				mathContent += c

			else if c == '['
				inputFlag = true

			else if c == ']'
				inputFlag = false

				if inputContent.slice(0, 2) == 'c:'
					result += @checkboxTemplate inputContent.slice(2)
				else if inputContent.slice(0, 2) == 'r:'
					result += @radiobuttonTemplate inputContent.slice(2)
				else
					result += @inputTemplate inputContent

				inputContent = ''

			else if inputFlag
				inputContent += c

			else
				result += c

		result.replace /(?:\r\n|\r|\n)/g, '<br />'

	mathTemplate: (content) ->
		'<script type="math/tex">' + content + '</script>'

	checkboxTemplate: (content) ->
		'<input type="checkbox">' + content

	radiobuttonTemplate: (content) ->
		'<input type="radio">' + content

	inputTemplate: (content) ->
		'<input value="' + content + '" size=' + content.length.toString() + '>'


