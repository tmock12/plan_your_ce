class CoursesController < ApplicationController
  before_filter :require_user, except: [:index, :show]
  expose(:provider)
  expose(:course)
  expose(:new_course) { current_user.courses.new(params[:course]) }

  def new
    course.build_course_address
  end

  def create
    if new_course.save
      redirect_to new_course
    else
      render :new
    end
  end

end
