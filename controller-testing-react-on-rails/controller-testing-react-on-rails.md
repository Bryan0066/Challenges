# Welcome to Floofr!

The top-rated website for Floof posting. Unfortunately, the developers of Floofr did not test-drive the development of this app, so we can't tell for sure if the Floof posts are being created reliably! Luckily, they've hired you on board to test their application.

### Set Up
```no-highlight
et get controller-testing-react-on-rails
cd controller-testing-react-on-rails

bundle
yarn install

bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```

### What's going on here?

You'll notice we have a few routes in our `routes.rb`. One of them allows you to visit the `show` page of a `floof` to see that floof's posts, as rendered by React. We also `api` namespaced routes setup to handle requests from the Fetch API, which will be run when our components need to retrieve data from our Rails backend.

*Note:* In order to view this in the browser, you'll need to visit the show page for an individual floof at `localhost:3000/floofs/1`. 

### Your Job

We want to make sure that Rails is communicating effectively with React. Write *controller* Rspec tests to make sure that the API endpoints are behaving as you expect.

You should test:

* That the `/api/v1/floofs/:id` endpoint returns the floof in question and its associated posts.
* That the `POST` request to `/api/v1/posts` creates a `Post` with the floof and post information that we expect.

Your tests should live in the `spec/controllers/api/v1` folder. They can be run by executing `bundle exec rspec`.chruby
