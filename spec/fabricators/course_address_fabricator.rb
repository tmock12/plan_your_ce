Fabricator(:course_address) do
  city "Catalina"
  state "California"
end

Fabricator(:random_course_address, from: :course_address) do
  city { Faker::Address.city }
  state { Faker::Address.state_abbr }
end
