class CoursesController < ApplicationController
  before_filter :require_user, except: [:index, :show]
  expose(:provider) { ProviderDecorator.decorate(Provider.find_by_user_id(current_user)) }
  expose(:courses)
  expose(:course) do
    if params[:id].present?
      CourseDecorator.decorate(Course.find(params[:id]))
    else
      provider.courses.build(params[:course])
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
