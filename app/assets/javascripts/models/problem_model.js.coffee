Lenny.Models.Problem = Backbone.Model.extend
    defaults:
        content: ''
        solutions: []

    initialize: ->
    	#debugger
    	this.solutions = new Lenny.Collections.Solution this.attributes.solutions, problem: @
    	console.log 'initialized'
    	#debugger

    parse: (response, options) ->
    	console.log 'response received for problem'
    	#debugger
    	response

    toJSON: ->
