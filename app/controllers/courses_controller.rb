class CoursesController < ApplicationController
  before_filter :require_user, except: [:index, :show]
  expose(:course)

  def create
    if course.save
      redirect_to course
    else
      render :new
    end
  end
end
