Given /^that course has the address:$/ do |table|
  address = table.hashes.first
  Fabricate(:course_address,
            city: address[:city],
            state: address[:state],
            course: @course
           )
end

Given /^that course has the dates:$/ do |table|
  hash = table.hashes.first
  start_date = Chronic.parse(hash[:start]).strftime('%a, %e %b %Y')
  end_date = Chronic.parse(hash[:end]).strftime('%a, %e %b %Y')
  @course.update_attributes(start_date: start_date, end_date: end_date)
end

Then /^I should see that courses formatted dates$/ do
  course = CourseDecorator.decorate(@course)
  [course.formatted_start_date, course.formatted_end_date].each do |date|
    page.should have_content(date)
  end
end
