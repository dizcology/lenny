class ProblemsController < ApplicationController
    respond_to :json

    def index
        problems = Problem.all
        respond_to do |format|
            format.html
            format.json { render json: problems }
        end
    end

    def update
    	#binding.pry
    	print params

    	problem = Problem.find(params[:id])
    	problem.update(problem_params)
    	problem.save!

    	render json: problem
    end

    def create
    	#binding.pry
    	problem = Problem.new
    	problem.update(problem_params)
    	problem.save!

    	render json: problem
    end

    def show
    	problem = Problem.find(params[:id])
    	render json: problem
    end

    private

    def problem_params
    	permitted = params.require(:problem).permit(:id, :content, :solutions)
    	permitted
	end

end
