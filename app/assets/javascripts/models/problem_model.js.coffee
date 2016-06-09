Lenny.Models.Problem = Backbone.Model.extend
    defaults:
        id: null
        content: ''
        solutions: []

    shownId: () ->
        if @get('id')
            @get('id')
        else
            'New'

    initialize: ->
    	#debugger
    	this.solutions = new Lenny.Collections.Solution this.attributes.solutions, problem: @
    	#console.log 'initialized'
    	#debugger

    parse: (response, options) ->
    	#console.log 'response received for problem'
    	#debugger
    	response

    toJSON: ->
