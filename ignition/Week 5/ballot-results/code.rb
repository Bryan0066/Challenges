# Required
require 'pry'
vote_results =
  {
    "Precinct 1": {
      'Mary Sue': 218,
      'Sally Jane': 455,
      'Billy Joe': 185
    },
    "Precinct 2": {
      'Mary Sue': 229,
      'Sally Jane': 41,
      'Billy Joe': 35
    },
    "Precinct 3": {
      'Mary Sue': 297,
      'Sally Jane': 423,
      'Billy Joe': 488
    },
    "Precinct 4": {
      'Mary Sue': 283,
      'Sally Jane': 171,
      'Billy Joe': 353
    }
  }

# Exceeds Expectations
finished = false

until finished
  user_precinct = ''
  user_candidate = ''
  continue = false

  until vote_results.keys.include?(user_precinct)
    puts "Which precinct do you live in? (Ex 'Precinct 1' )."
    user_precinct = gets.chomp.to_sym
    if vote_results.keys.include?(user_precinct)
      puts "\n#{user_precinct} selected\n"
    else
      puts "Please enter 'Precinct' followed by a number (1,2,3,4)."
    end
  end

  until vote_results[user_precinct].keys.include?(user_candidate)
    puts 'Which candidate would you like to vote for? (Mary Sue, Sally Jane, or Billy Joe).'
    user_candidate = gets.chomp.to_sym
    if vote_results[user_precinct].keys.include?(user_candidate)
      vote_results[user_precinct][user_candidate] += 1
      puts 'Vote counted!'
    else
      puts 'Please enter valid candidate.'
    end
  end

  loop do
    puts 'Thank you for voting! Is there anyone else who would like to vote? (Y, N).'
    user_continue = gets.chomp
    if user_continue == 'Y'
      break
    elsif user_continue == 'N'
      finished = true
      break
    else
      puts "Invalid input. Please enter 'Y' for yes and 'N' for no."
    end
  end

end

# End of Exceeds Expectations

# 1) Generate the voting totals by Precinct and Candidate as shown in the directions.
puts "Section 1: \n"

vote_results.each do |precinct, results|
  puts "**In #{precinct}**"

  results.each do |person, votes|
    puts "-#{person} got #{votes} votes"
  end

  puts ''
end

# 2) How many people voted in each precinct? Create a new hash where the keys name the precinct and the values start at 0. Iterate over the provided `vote_results` to update the totals.
puts "Section 2: \n"
votes_per_precinct = {}

vote_results.each do |precinct, results|
  votes_per_precinct[precinct] = 0
  results.each do |_person, votes|
    votes_per_precinct[precinct] += votes
  end
  puts "#{precinct} had #{votes_per_precinct[precinct]} votes"
end

puts ''
# 3) Which precinct had the highest voter turnout? Use the hash you created in Question 2 to return the answer.
puts "Section 3: \n"

most_votes_precinct = votes_per_precinct.key(votes_per_precinct.values.max)
most_votes_count = votes_per_precinct[most_votes_precinct]

puts "#{most_votes_precinct} recieved the most votes with #{most_votes_count} votes."
puts ''
# 4) Output the total number of votes per candidate in the format seen above. Create a new hash where the keys name the candidate and the values start at 0. Iterate over the provided `vote_results` to update the totals.
puts "Section 4: \n"

votes_per_candidate = {
  'Mary Sue': 0,
  'Sally Jane': 0,
  'Billy Joe': 0
}

vote_results.each do |_precinct, results|
  results.each do |candidate, votes|
    votes_per_candidate.each do |candidate_new_hash, _vote_count|
      votes_per_candidate[candidate_new_hash] += votes if candidate_new_hash == candidate
    end
  end
end

votes_per_candidate.each do |candidate, vote_total|
  puts "#{candidate} got #{vote_total}."
end
puts ''

# 5) Who was the winning candidate in Precinct 4 and how many votes did they get?
puts 'Section 5:'

vote_results.each do |precinct, results|
  next unless precinct.to_s.include?('Precinct 4')

  results.each do |candidate, votes|
    puts "#{candidate} won #{precinct} with #{votes} votes. \n" 
    if votes == results.values.max
  end
end
end
puts ''

# 6) How many people voted in total?
puts "Section 6: \n"

puts "There were #{votes_per_candidate.values.sum} votes total."
puts ''
# 7) Who won the election and how many votes did they get? Use the hash you created in Question 4 to return the answer.
puts "Section 7: \n"

winner = votes_per_candidate.key(votes_per_candidate.values.max)
winner_vote_count = votes_per_candidate.values.max

puts "#{winner} won with #{winner_vote_count} votes."
puts ''
# 8) How many more votes did the winner have as compared to the last place candidate? Use the hash you created in Question 4 and the winning candidate total votes value from Question 7 to complete this question.
puts "Section 8: \n"

last_place = votes_per_candidate.key(votes_per_candidate.values.min)
last_place_vote_count = votes_per_candidate.values.min
winner_margin = winner_vote_count - last_place_vote_count

puts "#{winner} beat #{last_place} by #{winner_margin} votes."
