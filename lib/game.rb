# frozen_string_literal: true

class Game
  def initialize
    # [
    #   rolls: [9, 1]
    # ]

    #  [[9,1]]

    @frames = []
  end

  def roll(pins)
    # @frames << pins
    last_rolls = @frames.last
    @frames << [] if last_rolls.sum == 10 || last_rolls.length == 2
    @frames.last << pins
  end

  def score
    @frames.sum_with_index do |frame, index|
      if frame.sum == 10 && @frames[index + 1]
        if frame.length == 1 # When a strike
          frame.sum + @frames[index + 1].sum
        else # When a spare
          frame.sum + @frames[index + 1][0]
        end
      else
        frame.sum
      end
    end
  end
end
