Fabricator(:user) do
  email 'fritz@example.com'
  password 'shipwrecked'
  password_confirmation 'shipwrecked'
end

Fabricator(:provider_user, from: :user) do
  role "provider"
end

Fabricator(:admin_user, from: :user) do
  email 'admin@example.com'
  role "admin"
end
