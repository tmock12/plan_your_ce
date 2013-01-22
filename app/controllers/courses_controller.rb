class CoursesController < ApplicationController
  expose(:courses)
  expose(:course) { CourseDecorator.decorate(Course.find(params[:id])) }
end
