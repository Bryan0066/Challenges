You've been tasked with making a quiz application in React! When the application is complete, you will be able to select a possible answer for the quiz. 

Note: The app will only show if your clicked-answer was correct if you complete to the Exceeds Expectations.

## Setup

This application comes with a Sinatra backend for use with Exceeds Expectations. While you do not need to use the Fetch API or interact with Ruby files for Meets Expectations, you will need to run a Sinatra server.

From your challenges directory, run the following:

```no-highlight
et get launch-sc-3-react-quiz-boston-37
cd launch-sc-3-react-quiz-boston-37
bundle install
bundle exec ruby server.rb
```

Then, in another terminal tab, run:

```no-highlight
yarn install
yarn run dev:client
```

If you go to [localhost:4567][localhost-4567], there will be nothing on the page except "React Quiz!", and there should be no errors in your console.

## Meets Expectations Requirements

Create a list of possible answers to the question "What is the best JavaScript Framework?" using the data set provided. For Meets Expectations, you only need to ensure that the chosen answer is highlighted. You do not need to display to the user a message of "Correct" or "Incorrect".

**NOTE**: You are not expected to replicate the answer order shown in the wireframes below! That is, don't worry about reordering the answers so that `React` is first, `Ember` is second, etc. -- display them in whatever order is easiest.

1. Using React and the data supplied in `react/src/constants/data.js`, render a static page displaying the question and its possible answers. **You may not modify the data in `data.js`**.

    ![React Quiz 1][react-quiz-1]

2. Clicking on a possible answer should change the background color of the button or element to blue. A CSS style has been provided for you with the `selected` class, and can be referenced in `public/home.css`. 

      ```css
      .selected {
        background-color: #89CFF0;
      }
      ```

    ![React Quiz 1][react-quiz-2]

You need only style your app to make the button change color.

### Tips

- Make an outline or plan for how you want to construct your app before beginning.
- Read your errors carefully. They will often point you directly to the offending piece of your code.
- Ensure that the `props` you use in each of your components contains the data you expect. Putting a `debugger` at the top of your components to inspect props may help with this.

## Exceeds Expectations Requirements

**Stop and `et submit` your work _right now_**, leaving a comment on the file in Horizon indicating that it is your Meets submission. The Exceeds Expectations portion will break your Meets Expectations code.

### Exceeds Part 1: Showing the Correct Answer

Ensure that when the correct answer is selected (indicated by the `correctAnswerId` for that question), that the text of "Correct!" or "Incorrect!" appears

1. On the initial render, the page should not display either 'Correct!' or 'Incorrect' ![React Quiz 1][react-quiz-1]

2. Clicking on a correct answer updates the page to display `Correct!` below the answers. ![React Quiz 2][react-quiz-3]

3. Clicking on an incorrect answer updates the page to display 'Incorrect' below the answers. ![React Quiz 3][react-quiz-4]

Please avoid hard-coding. Your application should behave correctly regardless of the order that the "frameworks" appear in `data.js`. To this end, your React code should make use of `correctAnswerId` to determine whether or not the selection is correct. As needed, please reach out to a staff member if you have questions. 

### Exceeds Part 1: Allowing for More Questions

1. The first question displayed when the page loads should still be the question given to you in the `constants/data.js` file.

- Add an API endpoint to the Sinatra application that can be visited at the path below. **Use this data (the `questions.json` file via your Sinatra API endpoint) for the remainder of this challenge.**

  ```no-highlight
  http://localhost:4567/api/v1/question.json
  ```

  The JSON response should be a **single random question with three incorrect answers and one correct answer**. It must be ONE question with its answers returned from the endpoint, not multiple. The following is an example of how the response body should be structured.

  ```json
  {
    "id": 1,
    "body": "What is the best JavaScript Framework?",
    "correctAnswerId": 3,
    "answers": [
      {
        "id": 1,
        "body": "Ember"
      },
      {
        "id": 2,
        "body": "Angular 2"
      },
      {
        "id": 3,
        "body": "React"
      },
      {
        "id": 4,
        "body": "Rails"
      }
    ]
  };
  ```

- When a correct answer is selected, your React application should display a button with the text `Next Question`.

  ![React Quiz 4][react-quiz-5]

- Clicking on the `Next Question` button will update the application to show a question randomly chosen from the server.

  - The page should not display either 'Correct!' or 'Incorrect' when the new question is initially displayed.

  ![React Quiz 5][react-quiz-6]

- As before, clicking on the possible answer that is correct for that question should still display Correct or Incorrect accordingly

[localhost-4567]: http://localhost:4567
[react-quiz-1]: https://i.imgur.com/fTK9QMu.png
[react-quiz-2]: https://i.imgur.com/hCoeFeE.png
[react-quiz-3]: https://i.imgur.com/ok979kw.png
[react-quiz-4]: https://i.imgur.com/o4fuvs3.png
[react-quiz-5]: https://i.imgur.com/Mwrn5zo.png
[react-quiz-6]: https://i.imgur.com/GwNsngf.png
