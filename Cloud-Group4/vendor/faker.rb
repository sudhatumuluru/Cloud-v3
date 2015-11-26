15.times do
  client = Client.new
  client.name = Faker::Name.first_name
  client.company = Faker::Company.name
  client.email = Faker::Internet.free_email(client.name)
  client.website = Faker::Internet.domain_name
  client.save
end

50.times do
  project = Project.new
  project.name = Faker::App.name
  project.description = Faker::Lorem.sentence
  project.status = ["new", "on-going", "completed"].shuffle.first
  project.start_date = Faker::Date.between(Date.today.beginning_of_year,Date.today.end_of_year)
  project.client_id = Client.order("RANDOM()").first.id
  project.save
end

300.times do
  task = Task.new
  task.name = Faker::Lorem.sentence
  task.project_id = Project.order("RANDOM()").first.id
  task.due_date = Faker::Date.between(Project.find(task.project_id).start_date,Date.today.end_of_year)
  task.is_completed = [true, false].shuffle.first
  task.save
end

  
