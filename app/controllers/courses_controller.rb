class CoursesController < ApplicationController
  expose(:courses)
  expose(:course) { Course.find(params[:id]).decorate }
end
