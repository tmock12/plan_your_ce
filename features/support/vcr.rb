require 'vcr'

VCR.configure do |c|
  c.hook_into :fakeweb
  c.cassette_library_dir = 'vcr_cassettes'
  c.ignore_localhost = true
  c.default_cassette_options = { record: :once }
end

VCR.cucumber_tags do |t|
  t.tag '@vcr', use_scenario_name: true
end
