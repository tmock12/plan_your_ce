Fabricator(:course) do
  title "Learn to swim"
  description "swimming is fun"
  audience ["stranded islanders", "shipwrecked persons"]
  credits "5"
  email "ernst@example.com"
  phone "678-867-5309"
  start_date { Date.today }
  end_date { Date.tomorrow }
  course_address
end
