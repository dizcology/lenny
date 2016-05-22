Lenny.Models.Problem = Backbone.Model.extend
    defaults:
        content: ''
        solutions: []

    initialize: ->
    	#this.solutions = new Lenny.Collections.Solution null, problem: @
    	#debugger
    	@

    parse: (response, options) ->
    	console.log response
    	response

    toJSON: ->
