### Instructions

As we all know, aspiring web developers get hungry, _very hungry_. But they don't have time to go to the store and wander the aisles aimlessly. Lucky for them, they can build tools to make their trips easier!

Write a web application to manage a grocery list. It should display the groceries currently on the list and provide a form for adding a new item to buy.

When you're done, put your grocery list into action and go get some food! (That part's optional.)

### Learning Goals

- Generate a dynamic web page in response to a `GET` request.
- Persist information from a user submitted via a `POST` request.
- Implement code based on acceptance tests.

### Getting Set Up

```no-highlight
et get launch-sc-2-grocery-list-sinatra
cd launch-sc-2-grocery-list-sinatra
bundle install
ruby server.rb
```

For running tests:
```
rspec
```

### Meeting Expectations Requirements

Acceptance tests have been written for you to build this grocery list app. **These tests are not to be modified.** After running the test suite with `rspec`, let the test errors guide your development and code implementation. Your first submission should satisfy the following requirements:

#### Grocery List Page
- Visiting `GET /` should redirect the user to `GET /groceries`.
- Visiting `GET /groceries` should display a list of groceries to purchase. 
- The name of each grocery item must be in [an `<li>` element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/li).
- The list of groceries is read from the `grocery_list.csv` file (unless in the test environment) which stores each item on a new line.
- On the grocery list page (path: "/groceries), there should be a link to the new grocery item form page. **Important:** This link should display the text "Add a Grocery Item" and a path of "/groceries/new"

#### Grocery Form Page
- Visiting `GET /groceries/new` should display a form for adding a new grocery item. Additionally, there should be text at the top of the page displaying "New Grocery Form Page"
- On the grocery form page, there is a link with the text "Groceries Index Page" that brings users back to the `"/groceries"` page when clicked.
- The form to add a new grocery item requires the grocery name to be specified, such that submitting an empty form does not modify the `grocery_list.csv` file.
  - This should be done via logic in `server.rb`. Note: For this step, you may NOT use JavaScript, or built in HTML helpers such as the "required" property.
- If a user submits an empty form, they stay on the form page, which has the text "New Grocery Form Page". 
- When a name is specified, the form submits to `POST /groceries` which saves the new item to the `grocery_list.csv` file.
  - Upon a successful post, the user should be brought to the grocery list and see the newly added item in the list
  - If a second grocery is added, both the first and second groceries should be listed
- All acceptance tests pass.

**Important Notes:**

* Your Capybara test suite will use the grocery_list_test.csv, but your app when run through `ruby server.rb` will use `grocery_list.csv.

### Sample Output

Below is an example of what the application should look like:

#### Grocery List
![Grocery List][sample-index]
#### Grocery Form
![Grocery Form][sample-form]

### Tips

- As always, take a moment to familiarize yourself with the codebase. Look at each provided file, especially your test files, to get an idea of what is expected of you.

- To avoid losing past information you'll probably want to **append** to a file rather than overwrite. You can open a file for appending with the following snippet of code (the second argument, `"a"`, passed to the `CSV`'s `open` method, specifies that you want to _append_ information):

```ruby
CSV.open("some-file.csv", "a") do |file|
  # your code here
end
```

- Reminder: When `rspec` is run, everything in the CSV file (except the headers) is deleted. This happens both before any of the tests run **and** after every `it` and `scenario` block in the test suite.

- The `--fail-fast` flag has been included in the `.rspec` file for you. This will run your test suite until a test fails, and then stop. If you'd like to see all of the failing tests at once, you may remove this flag.

- If you decide to make a Grocery class, note that in order for updates to take affect, you will have restart your server after every edit.

### Exceeding Expectations Requirements

You may update the spec files, as well as any configuration files in order to complete this portion of the System Check. **Please ensure you submit the version of your app for Meets Expectations before beginning Exceeds**

**Write acceptance tests for each of the following scenarios** and implement the features they describe:

- Add `quantity` as an optional field to the grocery item form.
  - Submitting a form with both a name and a quantity should add the grocery item with both properties (name and quantity) to the CSV, and the page should still redirect after form submission to "/groceries".
  - The quantity of each item should not be displayed on the list page ("/groceries).

- If the form is submitted with only a quantity and no grocery item, the grocery should not be added to the grocery csv, and the list should not be updated. Instead, the page should be re-rendered with the previously submitted quantity pre-filled in the form.

- If the form is submitted with only a grocery item and no quantity, the quantity for that grocery item should default to `1`.

- When viewing this list after visiting `GET /groceries`, each grocery item should be a link to a grocery details page. The grocery details page should be available at the path `GET /groceries/:id`. This link should lead to a page that displays the individual grocery name and quantity (a show page). This must be a separate page. The 

#### Important Notes for Exceeds

**When writing Capybara tests,** ensure that you are testing each possible workflow. More tests is better than too few.

Note: ensure you are writing/reading to or from the grocery_list_test.csv in your specs. 

[sample-index]: https://i.imgur.com/jOrJlMR.png
[sample-form]: https://i.imgur.com/6GhccIp.png
