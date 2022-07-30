project_1 = Project.create(name: 'Project Badass', description: "totally badass")
project_2 = Project.create(name: 'Project Beans', description: "how you bean")
project_3 = Project.create(name: 'Project boat', description: "totally floaty")

user_1 = User.create(full_name: "bob bobbyson", email: "bob@bob.bob")
user_2 = User.create(full_name: "dob dobbyson", email: "dob@dob.dob")
user_3 = User.create(full_name: "fob fobbyson", email: "fob@fob.fob")

Assignment.create(project: project_1, user: user_1)
Assignment.create(project: project_1, user: user_2)
Assignment.create(project: project_2, user: user_3)
Assignment.create(project: project_2, user: user_2)
Assignment.create(project: project_3, user: user_1)