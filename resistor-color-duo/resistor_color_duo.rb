require 'minitest/pride'

MAPPING = {
    "black" => 0,
    "brown" => 1,
    "red" => 2,
    "orange" => 3,
    "yellow" => 4,
    "green" => 5,
    "blue" => 6,
    "violet" => 7,
    "grey" => 8,
    "white" => 9
}

class ResistorColorDuo

    def self.colormap(color)
        index = 
        if color=="black"
            0
        elsif color=="brown"
            1
        elsif color=="red"
            2
        elsif color=="orange"
            3
        elsif color=="yellow"
            4
        elsif color=="green"
            5
        elsif color=="blue"
            6
        elsif color=="violet"
            7
        elsif color=="grey"
            8
        elsif color=="white"
            9
        else
            "DANGER WILL ROBINSON"
        end
        puts index
        index
    end

    # def self.value(colorlist)
    #     "#{colormap(colorlist[0])}#{colormap(colorlist[1])}".to_i
    # end

    def self.value(colorlist)
        "#{MAPPING[colorlist[0]]}#{MAPPING[colorlist[1]]}".to_i
    end

end

# puts ResistorColorDuo.new.value(["brown", "black"])

# thing = ResistorColorDuo.new
# thing.value(["blue", "red"])