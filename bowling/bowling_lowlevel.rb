class Game

    # Parameters for use in this class
    TOTAL_FRAMES = 10
    PINS = 10

    # Initialise an array for recording rolls
    def initialize
        @rolls = []
        @frames = []
    end

    # Define the roll method
    def roll(pins)

        # Error-raising: silly numbers of pins
        raise 'Pins must have a value from 0 to 10.' unless pins.between?(0, PINS)

        # Add pin count to the rolls array
        @rolls.push pins

    end

    # Define the score method
    def score

        # Initialise local counters
        scoreCounter = 0
        rollIndex = 0
        frameIndex = 0

        # Block to run over all frames
        @rolls.each do |roll|
            if frameIndex < 10
                if strike?(rollIndex)
                    # A strike means a special score and the frame is cleared in one roll
                    scoreCounter += strikeScore(rollIndex)
                    rollIndex += 1
                elsif spare?(rollIndex)
                    # A strike means a special score and the frame is cleared in two rolls
                    scoreCounter += spareScore(rollIndex)
                    rollIndex += 2
                else
                    # A strike means a regular score and the frame is cleared in two rolls
                    scoreCounter += regularScore(rollIndex)
                    rollIndex += 2
                end
                frameIndex += 1
            end
        end

        # Return value
        scoreCounter

    end

    # Everything below a private reference is designed to be internal only
    private

    # Was this frame a strike?
    def strike?(rollIndex)
        @rolls[rollIndex] == 10
    end

    # Was this frame a spare?
    def spare?(rollIndex)
        @rolls[rollIndex] + @rolls[rollIndex+1] == 10
    end

    # Special score for a strike: the number of pins in this frame and the next two rolls
    def strikeScore(rollIndex)
        10 + @rolls[rollIndex + 1] + @rolls[rollIndex + 2]
    end

    # Special score for a spare: the number of pins in this frame and the next roll
    def spareScore(rollIndex)
        10 + @rolls[rollIndex + 2]
    end

    # Score for a regular frame: the number of pins in this frame
    def regularScore(rollIndex)
        @rolls[rollIndex] + @rolls[rollIndex + 1]
    end

end

game = Game.new
rolls = [3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6]
rolls.each { |pins| game.roll(pins) }
puts game.score
