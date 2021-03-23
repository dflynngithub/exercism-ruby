=begin
Write your code for the 'High Scores' exercise in this file. Make the tests in
`high_scores_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/high-scores` directory.
=end

class HighScores

    # Initialise by reasing in all current scores
    def initialize(scores)
        @scores = scores
    end

end

high_scores = HighScores.new([10, 30, 90, 30, 100, 20, 10, 0, 30, 40, 40, 70, 70])
puts high_scores.scores
