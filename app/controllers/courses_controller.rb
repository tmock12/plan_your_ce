class CoursesController < ApplicationController
  before_filter :require_user, except: [:index, :show]
  expose(:provider) { ProviderDecorator.decorate(current_user) }
  expose(:course) do
    if params[:id].present?
      CourseDecorator.decorate(current_user.courses.find(params[:id]))
    else
      current_user.courses.build(params[:course])
    end
  end

  def new
    course.build_course_address
  end

  def create
    if course.save
      redirect_to course
    else
      render :new
    end
  end

end
