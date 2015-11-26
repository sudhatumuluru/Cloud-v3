desc "This file is used for setting up categories"
task :setup_categories => :environment do
  Category.create(name: "Design")
  Category.create(name: "Development")
  Category.create(name: "Testing")
  Category.create(name: "Maintenance")
  Category.create(name: "Grapic Design")
end
