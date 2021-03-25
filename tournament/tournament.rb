# A tournament takes place for a collection of teams and involves many games
class Tournament

    # Available points for the possible outcomes
    POINTS_FOR_A_WIN = 3
    POINTS_FOR_A_DRAW = 1
    POINTS_FOR_A_LOSS = 0

    # Formatting for the report
    REPORT_TITLE = 
    <<~TITLE
    Team                           | MP |  W |  D |  L |  P
    TITLE
    REPORT_FORMAT = "%-30s | %2s |  %s |  %s |  %s |  %s\n"

    # Initialise by collecting games and parsing the full report
    def initialize
        @board = 0
        @teams = Hash.new {|hash,key| hash[key] = Team.new(key)} # Make a new team as needed
        lines = input.split("\n")                                # Split games by a new line
        lines.each {|line| parse(line)}                          # Parse every game played
    end

    # Feed input into the classes that I'm making (more extensible this way)
    # Extract team names from that class, because the name represents a key by which each team is hashed in this class
    # team.name
    # Store wins, losses, draws, but not the points associated
    # All the information is in the team data, so calculate as needed
    # First, print out tally line-by-line, and then sort them
    
    # Generate a tally
    def self.tally(input)
        REPORT_TITLE + make_board
    end

    # Generate a report
    def self.make_board
        if @board.nil? @board = ''
        @teams.each do |team|
            @board << REPORT_FORMAT % [team.name, 0, 1, 1, 1, 1]
        end
    end

    # Anything after does not require public access

    # Parse one line of results
    def parse(line)
        team1, team2, result = line.split(';')
        if(result == 'win')
            @teams[team1].win
            @teams[team2].lose
        elsif(result == 'loss')
            @teams[team1].lose
            @teams[team2].win
        elsif(result == 'draw')
            @teams[team1].tie
            @teams[team2].tie
        end
    end

end

# A team is an object which can win/lose/tie games and play more than once
class Team

    # Want to read a team's name externally
    attr_reader :name

    # Initialise by identifying a name and zeroing out the team's tally
    def initialize(name)
        @name = name
        @wins = 0
        @losses = 0
        @ties = 0
    end

end

input = <<~INPUT

INPUT

report = Tournament.tally(input)
puts report