namespace :db do
  desc 'Populate test data'

  task :populate => :environment do
    User.destroy_all
    Provider.destroy_all

    Fabricate(:admin_user, email: "admin@example.com")

    4.times do
      Fabricate(:random_provider)
    end

    taylor = Provider.create!(
      name: "Taylors Dental",
      phone: "7703135078",
      cerp_number: "123",
      user_attributes: {
        email: "taylor@hashrocket.com",
        password: "password",
        password_confirmation: "password",
      },
      provider_address_attributes: {
        street_1: "4435 touchton road",
        city: "Jacksonville",
        state: "FL",
        zip_code: "32246"
      }
    )
    taylor.user.set_role!("provider")

    Provider.first.activate!

    3.times do
      Fabricate(:course, provider: Provider.first)
    end

  end
end
