# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


manager = User.create!(email: "tanya@gmail.com", name: "Tanya Saroha", role: "admin", password: "tanya123")
dev1 = User.create!(email: "smita@gmail.com", name: "Smita Yadav", role: "developer", password: "smita123")
dev2 = User.create!(email: "ayesha@gmail.com", name: "Ayesha Rao", role: "developer", password: "ayesha123")
dev3 = User.create!(email: "jaya@gmail.com", name: "Jaya Singh", role: "developer", password: "jaya123")
glluu = Project.create(name: "Glluu", description: "This will let relatives and friends interact with each other", created_by_id: manager.id)
ffd = Project.create(name: "FFD", description: "Diabetic patients can be monitored by doctors", created_by_id: manager.id)
Resource.create(is_active_user: true, project_id: glluu.id, user_id: dev1.id)
Resource.create(is_active_user: true, project_id: glluu.id, user_id: dev2.id)
Resource.create(is_active_user: true, project_id: ffd.id, user_id: dev2.id)
Resource.create(is_active_user: true, project_id: ffd.id, user_id: dev3.id)


Todo.create!(title: 'TODO 1 Project 1', type: "bug", description: "This is description for to-do 1", created_by_id: manager.id, status: "new", project_id: glluu.id, assigned_to_id: dev1.id)
Todo.create!(title: 'TODO 2 Project 1', type: "bug", description: "This is description for to-do 2", created_by_id: manager.id, status: "done", project_id: glluu.id, assigned_to_id: dev1.id)
Todo.create!(title: 'TODO 3 Project 1', type: "bug", description: "This is description for to-do 3", created_by_id: manager.id, status: "in_progress", project_id: glluu.id, assigned_to_id: dev1.id)
Todo.create!(title: 'TODO 4 Project 1', type: "bug", description: "This is description for to-do 4", created_by_id: manager.id, status: "in_progress", project_id: glluu.id, assigned_to_id: dev1.id)
Todo.create!(title: 'TODO 5 Project 1', type: "bug", description: "This is description for to-do 5", created_by_id: manager.id, status: "new", project_id: glluu.id, assigned_to_id: dev2.id)
Todo.create!(title: 'TODO 6 Project 1', type: "bug", description: "This is description for to-do 6", created_by_id: manager.id, status: "new", project_id: glluu.id, assigned_to_id: dev2.id)


Todo.create!(title: 'TODO 1 Project 2', type: "bug", description: "This is description for to-do 1", created_by_id: manager.id, status: "new", project_id: ffd.id, assigned_to_id: dev2.id)
Todo.create!(title: 'TODO 2 Project 2', type: "bug", description: "This is description for to-do 2", created_by_id: manager.id, status: "done", project_id: ffd.id, assigned_to_id: dev2.id)
Todo.create!(title: 'TODO 3 Project 2', type: "bug", description: "This is description for to-do 3", created_by_id: manager.id, status: "in_progress", project_id: ffd.id, assigned_to_id: dev2.id)
Todo.create!(title: 'TODO 4 Project 2', type: "bug", description: "This is description for to-do 4", created_by_id: manager.id, status: "in_progress", project_id: ffd.id, assigned_to_id: dev3.id)
Todo.create!(title: 'TODO 5 Project 2', type: "bug", description: "This is description for to-do 5", created_by_id: manager.id, status: "new", project_id: ffd.id, assigned_to_id: dev3.id)
Todo.create!(title: 'TODO 6 Project 2', type: "bug", description: "This is description for to-do 6", created_by_id: manager.id, status: "new", project_id: ffd.id, assigned_to_id: dev3.id)