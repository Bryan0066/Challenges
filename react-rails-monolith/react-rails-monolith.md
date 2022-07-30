# React Rails Monolith

## Background

Let's actually go through our stack of technologies and put all of our understanding of React and Rails together.

**Our Job:** There is a pressing need to review breakfast cereals. There's so much to talk about and so few places to do it. You're going to be creating an amazing cereal discovery app to give everyone a place to discuss the cereals of the world. 

Beware, this assignment is going to take a good bit of time and is focused on getting you to use our whole stack. It will take quite a bit of time just to get the basic application up and running. Don't be frustrated. Learning all of these technologies takes a good bit of time, so does learning how to put them all together!

You've been provided with a boilerplate that has React already setup and ready to go, complete with a testing setup! Run the following commands in one tab:

```
et get react-rails-monolith
bundle install
rake db:create
rails s
```

And in another tab run the following:

```
yarn install
yarn run dev:client
```

This should get everything running! You should see no errors in the console and a very basic message displayed on the page.

Your react code runs from the `app/javascript/packs` file (this is your new `main.js` file, and renders your app), and your components can be placed in `app/javascript/components`. Your task is the develop both the React Frontend and Rails backend in order to build out the features of the app.

## Instructions

1. First, we must get this application setup with some actual React components.
Create a component called `App` that displays a basic header about cereals e.g. "Welcome to the Sensational Cereals App". This will be the start of your React application. It's important to ensure that this very basic, static page renders before adding more to your application.

2. Next, let's get your React Router setup. In the `App` component, change the text about cereals to use React Router with two routes: a cereals index route (`/cereals`) that will eventually display all the cereals, and a dynamic cereals show route (`/cereals/:id`) that displays the information for a specific cereal. For every route you setup in React Router, you'll need to also handle that route in your Rails backend. 

3. **Index of Cereals:** Define a CerealsIndexContainer component that will fetch to your rails application in order to retrieve cereal data for rendering. You'll need a migration, a model, and a controller for your cereals, as well as routes for navigation, and API routes that you can fetch to. Don't forget to namespace your API controller as well. Ensure that this feature is available when navigating to "/cereals". The page should show all cereals that you have seeded in a list, displaying only their name.

    Cereals should have the following attributes: name (string, required), brand (string, required) and sugar-level (string, optional). If you would like to add other attributes, go for it!

3. **Cereals Show Page:** Define a CerealsShowContainer component that should display more information about a specific cereal (all of its attributes should be on the screen). Update your code to ensure that you are fetching to the right endpoint in your backend API controller as well. 

    Once done, update the "/cereals" page to make every cereal name a link to a cereal show page. You'll need to use React Router's `Link` component for this step. 

4. Test that API controller with controller tests! Every API controller endpoint should have a test for it (:index and :show). Make sure to tackle the reading on API controller tests before beginning this step (if that material has been released for your class!).

## Bonus Challenge

5. At "/cereals/new", a user should see a new cereal form (rendered in React). Ensure that this form posts to your API controller and persists a new cereal. 

    You'll need to also redirect away from this form page to the newly created Cereal Show page if submitted successfully. Use the `Redirect` component from React Router for this. 

6. If filled out incorrectly, ActiveRecord validations should be displayed on the screen. Make sure that you return those error messages in the response of your new cereal POST request. Grab them from the response body, and set them in some error state for display. This will be tricky!

7. STYLE IT! Foundation is available in this application already. Ensure the following: 

    * add a custom google font to your website 
    * have a styled navbar with navigation buttons
    * show each cereal on the index page as a box in a grid that is three cereals wide. After the first three, your app should show the next three cereals in a row. 
    * display a warning message on the cereal show page if the sugar levels of a cereal are too high (you can determine the condition for this). 
    * add a new column to your cereals "image", that can store a url to an image of a cereal on the internet. You won't be able to upload an image just yet, so just copy an image url from the web. Update your new cereal form accordingly. 
    * ensure that all elements are spaced out from one another with margin (and padding if needed). No elements should be flush against one another, and no elements should be right up against the side of the screen (except your navbar)

Continue to add flair as you see fit! 

## Final Words

This is a bear of an assignment! It requires a lot of files and code and really ties together everything you've learned thus far as a Launcher.

If you complete this assignment, you should feel *incredibly* confident about your ability to use our *entire* stack.

Remember to use your `debugger`s and `pry`s to get yourself through the difficult times when your code inevitably don't work. This is as good an assignment as any to pair program on because you can help each other fill in your gaps in knowledge. You've got this! Get excited to use the entire stack we've used!

Also, don't forget to style as you go with your React components! If you wait until the end it's going to be a far bigger pain to fit all the styling in at once. Then you can refine how it all fits together at the end!

**GOOD LUCK!**
