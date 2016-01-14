class Api::YogaClassesController < ApplicationController
  def index
    @yoga_classes = YogaClass.all
  end
end
