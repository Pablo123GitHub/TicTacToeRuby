class Grid

  def initialize
    @answers_array = []
  end

  def answers_total
    @answers_array.length
  end

  def records(inputNumber)
    raise 'Index spot already taken' if @answers_array.include? inputNumber
    raise 'Invalid index' unless (0..8).include?(inputNumber)
    @answers_array.push(inputNumber)
  end

end