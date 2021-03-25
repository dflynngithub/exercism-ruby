class Clock

    attr_accessor :hour, :minute

    HOURS_IN_A_DAY = 24
    MINUTES_IN_AN_HOUR = 60
    MINUTES_IN_A_DAY = HOURS_IN_A_DAY * MINUTES_IN_AN_HOUR

    def initialize(params)
        @hour = params[:hour] || 0
        @minute = params[:minute] || 0
        shuffle_into_correct_format
    end

    def shuffle_into_correct_format
        total_minutes = @hour * MINUTES_IN_AN_HOUR + @minute
        @hour, @minute = total_minutes.modulo(MINUTES_IN_A_DAY).divmod(MINUTES_IN_AN_HOUR)
    end

    def + (another_clock)
        Clock.new(
          hour: @hour + another_clock.hour, 
          minute: @minute + another_clock.minute
        )
    end

    def - (another_clock)
        Clock.new(
          hour: @hour - another_clock.hour, 
          minute: @minute - another_clock.minute
        ) 
    end

    def == (another_clock)
        # tempclock = Clock.new(
        #   hour: @hour - another_clock.hour, 
        #   minute: @minute - another_clock.minute
        # )
        # total_minutes = tempclock.hour * MINUTES_IN_AN_HOUR + tempclock.minute
        # total_minutes == 0
        @hour == another_clock.hour && @minute == another_clock.minute
    end

    def to_s
        '%02d:%02d' % [ @hour, @minute ]
    end

end

clock1 = Clock.new(hour: 15, minute: 37)
clock2 = Clock.new(hour: 15, minute: 36)
puts clock1 == clock2