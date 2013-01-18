Fabricator(:provider) do
  name 'Swiss Family Dentistry'
  phone '770-867-5309'
  cerp_number '12345'
  provider_address
  user(fabricator: :provider_user)
end

Fabricator(:random_provider, from: :provider) do
  user { Fabricate(:provider_user, email: Faker::Internet.email) }
end
