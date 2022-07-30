The results are in from all four precincts!

## Getting Started
```no-highlight
et get ballot-results
cd ballot-results
code .
```

## Instructions

Mary Sue, Sally Jane, and Billy Joe all ran strong campaigns for the highly coveted position of Representative to Those with First Names as Last Names. The candidates _really_ want to know who won, so they've turned to you to make sense of the results.

### Implementation Details

- Use `.each` and use it often!
- Use descriptive variables that allow others to clearly understand what the values are.
- Be sure your output matches the provided sample data.
- No hard-coding! For instance, if asked to total the amount of votes that Mary Sue received, don't write print `1027`, but instead use ruby to iterate over the data structure provided and sum the total with the aid of a `.each` loop.

### Tips

- Insert a `binding.pry` after each line of code to inspect what returns you're generating.

### Meets Expectations

#### Part One

Use the `vote_results` hash provided in `code.rb` to generate the following results in your terminal:

```no-highlight
1)
**In Precinct 1**
-Mary Sue got 218 votes
-Sally Jane got 455 votes
-Billy Joe got 185 votes

**In Precinct 2**
-Mary Sue got 229 votes
-Sally Jane got 41 votes
-Billy Joe got 35 votes

**In Precinct 3**
-Mary Sue got 297 votes
-Sally Jane got 423 votes
-Billy Joe got 488 votes

**In Precinct 4**
-Mary Sue got 283 votes
-Sally Jane got 171 votes
-Billy Joe got 353 votes
```

#### Part Two

Answer the following questions and generate the output to match what you see below without hard coding.

```no-highlight
2)
Precinct 1 had 858 votes.
Precinct 2 had 305 votes.
Precinct 3 had 1208 votes.
Precinct 4 had 807 votes.

3)
Precinct 3 had the most votes with 1208 votes.

4)
Mary Sue had 1027 votes
Sally Jane had 1090 votes
Billy Joe had 1061 votes

5)
 Billy Joe won Precinct 4 with 353 votes.

6)
 In total, 3178 people voted.

7)
Sally Jane had the most votes with 1090 votes.

8)
Sally Jane beat Mary Sue by 63 votes.
```  

2) How many people voted in each precinct? Create a new hash where the keys name the precinct and the values start at 0. Iterate over the provided `vote_results` to update the totals.  

3) Which precinct had the highest voter turnout? Use the hash you created in Question 2 to return the answer. Use iteration to generate your answer. 

4) Output the total number of votes per candidate in the format seen above. Create a new hash where the keys name the candidate and the values start at 0. Iterate over the provided `vote_results` to update the totals.

5) Who was the winning candidate in Precinct 4 and how many votes did they get? Use iteration and comparison operators to determine the winning candidate.

6) How many people voted in total? Use iteration to total the votes.

7) Who won the election and how many votes did they get? Use the hash you created in Question 4 to return the answer. Again, use iteration to get your answer.

8) How many more votes did the winner have as compared to the last place candidate? Use the hash you created in Question 4 and the winning candidate's total votes value from Question 7 to complete this question.

Running `ruby code.rb` from this application's directory should output the example output above.

### Exceeds Expectations

Being able to see the ballot results means we can now allow users to cast their vote! Let's generate an interactive program that prompts the user and generates the output seen below.

* This program should first ask the user which precinct they live in. 
* Then, the program should ask which candidate they want to vote for (this should update the `vote_results` object, adding to the number values that already exist). Multiple users should be able to vote until everyone has finished, then display the final results:

```no-highlight
Which precinct do you live in? (1, 2, 3)
=> 2

Which candidate would you like to vote for? (Mary Sue, Sally Jane, or Billy Joe)
=> Sally Jane

Thank you for voting! Is there anyone else with you that would like to cast a vote with this program? (Y, N)
=> Y

Which precinct do you live in? (1, 2, 3)
=> 1

Which candidate would you like to vote for? (Mary Sue, Sally Jane, or Billy Joe)
=> Billy Joe

Thank you for voting! Is there anyone else who would like to vote? (Y, N)
=> N

The final results are:
...
```

The final output of running `code.rb` should be your answers to the original questions about the ballot results, including the new votes! 

Feel free to get creative in the wording of your program (questions and acceptable answers), and **be sure to handle any bad user input by asking the question again.**