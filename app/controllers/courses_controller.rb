class CoursesController < ApplicationController
  expose(:courses)
  expose(:course) { Course.find(params[:id]).decorate }
  expose(:provider) { course.provider }
end
