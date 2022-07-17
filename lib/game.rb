class Game
  def initialize
    @roles = []
    @current_role = 0
  end

  def roll(x)
    @roles[@current_role] = x
    @current_role += 1
  end

  def score
    index = 0
    score = 0

    10.times do
      if strike?(index)
        score += 10 + @roles[index + 1] + @roles[index + 2]
        index += 1
      elsif spare?(index)
        score += 10 + @roles[index + 2]
        index += 2
      else
        score += @roles[index] + @roles[index + 1]
        index += 2
      end
    end

    score
  end

  private

  def spare?(index)
    @roles[index] + @roles[index + 1] == 10
  end

  def strike?(index)
    @roles[index] == 10
  end
end
