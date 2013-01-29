VCR.configure do |c|
  c.cassette_library_dir = 'vcr_cassettes'
  c.hook_into :fakeweb
  c.configure_rspec_metadata!
end
