class ProblemsController < ApplicationController
    respond_to :json

    def index
        problems = Problem.all
        respond_to do |format|
            format.html
            format.json { render json: problems }
        end
    end
end
