class Providers::CoursesController < AuthenticatedController
  expose(:provider) do
    Provider.find_by_user_id(current_user).decorate
  end
  expose(:courses) { provider.courses }
  expose(:course, attributes: :course_params)
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
    course.update_attributes(course_params)
    redirect_to course
  end

  protected

  def course_params
    params.require(:course).permit(:category, :credits, :description, :email,
    :end_date, :instructor, :max_attendance, :phone, :price, :start_date,
    :title, :provider, :airport, :airport_title, audience: [],
    course_address_attributes: [:street_1, :street_2, :city, :state, :zip_code])
  end

end
