class Providers::CoursesController < AuthenticatedController
  expose(:provider) do
    ProviderDecorator.decorate(Provider.find_by_user_id(current_user))
  end
  expose(:courses) { provider.courses }
  expose(:course) do
    if params[:id].present?
      CourseDecorator.decorate(courses.find(params[:id]))
    else
      courses.build(params[:course])
    end
  end
  expose(:active_courses) do
    CourseDecorator.decorate_collection(courses.active)
  end
  expose(:inactive_courses) do
    CourseDecorator.decorate_collection(courses.inactive)
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
