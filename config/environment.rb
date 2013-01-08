# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
PlanYourCe::Application.initialize!

ActionView::Base.default_form_builder = FormBuilder
