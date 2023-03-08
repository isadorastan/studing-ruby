class MainController < ApplicationController
    def index
        flash[:notice] = "Success"
        flash[:alert] = "Not success"
    end
end