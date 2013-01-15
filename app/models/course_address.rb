class CourseAddress < Address
  belongs_to :course
  validates_presence_of :city, :state
end
