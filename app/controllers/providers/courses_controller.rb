class Providers::CoursesController < AuthenticatedController
  expose(:provider) do
    Provider.find_by_user_id(current_user).decorate
  end
  expose(:courses) { provider.courses }
  expose(:course)
  expose(:active_courses) { courses.active.decorate }
  expose(:inactive_courses) { courses.inactive.decorate }

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
