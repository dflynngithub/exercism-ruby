class Game

    
    # Initialise score and frame counter arrays
    def initialize
        @scores = []
        @current_frame = []
    end


    # Define the roll method
    def roll(pins)

        # Error-raising
        raise 'Cannot roll after the game is over.' if game_ended?
        raise 'Pins must have a value from 0 to 10.' if pins < 0 || pins > 10

        # Append this frame with the number of pins bowled over
        @current_frame << pins

        # Number of pins hit in this frame
        raise 'Pin count exceeds pins on the lane.' if @current_frame.reduce(0, :+) > 10
    
        # Check whether the frame is finished
        return unless @current_frame.length == 2 || @current_frame.reduce(:+) > 9

        # Append score tally with this frame
        @scores << @current_frame

        # Empty the current frame array
        @current_frame = []

    end


    # Define the score method
    def score

        # Error-raising
        raise 'Score cannot be taken until the end of the game.' unless game_ended?
        raise 'Pin count exceeds pins on the lane.' if @current_frame.reduce(0, :+) > 10

        # Add the current frame to score tally
        @scores << @current_frame

        # Add all frame scores together
        (0..9).map { |i| value_for_frame(i) }.reduce(:+)

    end


    # Everything below a private reference is designed to be internal only
    private


    # Value for this frame
    def value_for_frame(index)
        frame = @scores[index]
        if strike? frame
        next_two = @scores.drop(index + 1).flatten.take(2)
        frame.first + next_two.reduce(:+)
        elsif spare? frame
        frame.reduce(:+) + @scores[index + 1].first
        else
        frame.reduce(:+)
        end
    end


    # Was this frame a strike?
    def strike?(frame)
        frame.first == 10
    end


    # Was this frame a spare?
    def spare?(frame)
        !strike?(frame) && frame.reduce(:+) == 10
    end


    # Are we at the end of the game?
    def game_ended?

        # Return false if there have been fewer than 10 frames
        if @scores.length > 9
            return false
        end

        # Special case: frame 10 bowled a spare
        if spare?(@scores[9])

            # There should be one score saved in the remaining frame
            @current_frame.length == 1
        
        # Special case: frame 10 bowled a strike
        elsif strike?(@scores[9])

            # Drop the first 10 elements from scores, return remaining elements, flatten them and check the length
            @scores.drop(10).flatten.length == 2

        # No special cases here, so game has ended
        else
            true
        end
    end

end

game = Game.new
rolls = [3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6]
rolls.each { |pins| game.roll(pins) }
puts game.score
