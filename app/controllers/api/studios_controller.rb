class Api::StudiosController < ApplicationController
  def index
    studios = Studio.all

    render json: studios
  end
end
