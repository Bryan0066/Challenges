You will be building a simple blog in React! This blog will have an index page showing recently submitted articles as well as a form to add more articles. Clicking on the name of an article on your index page will bring the user to a show page with more details about that article.

## Setup

From your challenges directory, run the following:

```no-highlight
et get launch-sc-4-react-simple-blog
cd launch-sc-4-react-simple-blog
bundle exec bundle install
ruby server.rb
```

Then in another terminal tab run:

```no-highlight
yarn install
yarn run dev:client
```

Visit <http://localhost:4567> in your browser. You should see a page that simply says `Replace this div with your Router.` There should be no errors in your JavaScript console.

**Important:** After you make changes to your code, do a **hard refresh** (`Command + Shift + R`) to see the changes in your browser. We aren't using `webpack-dev-server` the way we do in other assignments.

## Meets Expectations Requirements

Your ultimate goal is to create an application that a user can use to display and add saved articles (which have a title and a body). You have been given all the required React components; familiarize yourself with these components and their relationships before beginning.

**Note:** Styling is highly encouraged but not mandatory.

Additionally, you are allowed to edit the provided the code and components, so long as the acceptance criteria below is satisfied.

### Step 1

```no-highlight
As a user
I want to see a list of articles
So I can get a sense of what is going on in the world
```

Acceptance Criteria:

- When a user navigates to the root path (`/`), they should see the titles (but not the bodies) of all the articles in the application. (You do not need to handle for the path `/articles`.)

Additional Info:

- Be sure to carefully review the provided code to see what has already been implemented for you
- You'll need to use React Router to complete this step
- `ArticlesIndexContainer` should keep track of the articles in state after fetching them from the backend when the component mounts to the page

- **You may see an error in the console**, `Failed prop type: You provided a value prop to a form field without an onChange handler.`. You may ignore this error for now; we'll address it in Step 3!

### Step 2

```no-highlight
As a user
I want to see a specific article
So I can get details about that article
```

Acceptance Criteria:

- Clicking on an article listed on the index page should direct the user to that article's show page, at `/articles/<article-id>`. For example, if I click on the title of an article with an id of `4`, I should be taken to `/articles/4`.
- Similarly, if I navigate directly to `/articles/4` in my browser (by typing in the URL directly), I should be taken to the show page for the article with an id of `4`
- On the `/articles/<article-id>` show page, the user should see the article's title and the body (and not the title or body of any other article!).

Additional Info:

- You'll need to employ your router skillz again, and be aware of the routes provided in `server.rb`
- Your `ArticleShowContainer` should fetch the data for the article of interest (and only that article) from the backend and persist it in state. You'll need to use the dynamic id provided to you by the React Router to direct your fetch call to the correct path.

### Step 3

```no-highlight
As a user
I want to type into a form
So I can contribute to an awesome list of articles
```

Acceptance Criteria:

- A user should be able to type into the form, have the form update accordingly (displaying whatever they have typed), and have their typed information tracked in the form components state.

Additional Info:
- The user's input into the form (as they type, before they submit) **must** be stored in state in `ArticleFormContainer`.
- **The input fields for the body and title of your new article form should be fully controlled** (the input fields' value are dependent on the state of `ArticleFormContainer`, and the onChange events for those fields change the form field state).
- Check the provided data in `articles.json` and the code in `server.rb` to determine how the submitted form data should be formatted. Having improperly named default state or having improperly named `input` attributes can potentially cause issues.

### Step 4

```no-highlight
As a user
I want to submit what I've typed into the form
So I can keep track of the awesome articles I've contributed
```

Acceptance Criteria:

- When a user submits the form, the new article is added to our persisted data in the `articles.json` file
- The list of articles on our current page (the index page at the `/` path) should now include the new article, immediately below the previous articles.
- **The page should not refresh upon submitting the form.**

Additional Info:

- Make sure that the information you're submitting in the body of your fetch request matches the format of the data currently stored in your `articles.json` file.
- Upon a successful POST, you should add the article returned from your server to the articles already in your `state`!

## Exceeds Expectations Requirements

This application is looking good, but we want to ensure that the user has a smooth user experience. For exceeding expectations:

- In your React code, validate that both the body and the title fields have been filled out by the user (relying on HTML properties like `required` is insufficient). When a user does not fill in all the required fields:
  - the form should not submit, and should stay filled in
  - errors indicating _which fields_ are missing should appear on the page if the user attempts to submit the form with missing values
- After a new article has been submitted, redirect the user to that article's show page by using React Router.
- Create a button with the text "Clear" on it. This button should clear out the state for the form's fields, and if text had been typed into those form fields, the text should no longer display.
