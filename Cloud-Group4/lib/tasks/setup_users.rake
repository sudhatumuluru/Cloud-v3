desc "This file is used for setting up users and roles"
task :setup_users => :environment do
  Role.create(name: "super_admin")
  Role.create(name: "admin")
  Role.create(name: "user")

  user = User.new(email: "super.admin@gmail.com", password: "secret123")
  user.save
  Permission.create(user_id: user.id, role_id: Role.first.id)

  user = User.new(email: "admin@gmail.com", password: "secret123")
  user.save
  Permission.create(user_id: user.id, role_id: Role.second.id)
end