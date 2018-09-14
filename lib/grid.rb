class Grid

  def initialize
    @answers_array = []
  end

  def answers_total
    @answers_array.length
  end

  def records(inputNumber)
    @answers_array.push(inputNumber)
  end


end