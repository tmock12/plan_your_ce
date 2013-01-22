class Providers::CoursesController < AuthenticatedController
  expose(:provider) do
    ProviderDecorator.decorate(Provider.find_by_user_id(current_user))
  end
  expose(:course) do
    if params[:id].present?
      CourseDecorator.decorate(provider.courses.find(params[:id]))
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

  def update
    course.update_attributes(params[:course])
    redirect_to course
  end

end
