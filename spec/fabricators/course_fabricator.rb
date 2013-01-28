Fabricator(:course) do
  title "Learn to swim"
  description "swimming is fun"
  audience ["stranded islanders", "shipwrecked persons"]
  credits "5"
  email "ernst@example.com"
  phone "678-867-5309"
  start_date { (Date.today + 2.days) }
  end_date { (Date.today + 1.week) }
  airport { Airport.all.sample }
end

Fabricator(:random_course, from: :course) do
  title { Faker::Company.bs }
  description { Faker::Lorem.paragraph(7) }
end
