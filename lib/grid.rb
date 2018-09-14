class Grid

  attr_reader(:answers_array)

  def initialize
    @answers_array = Array.new(9, "")
  end


  # def records(index, cross_or_nought)
  #   raise 'Index spot already taken' if @answers_array.include? index
  #   raise 'Invalid index' unless (0..8).include?(index)
  #   @answers_array[index] = cross_or_nought
  # end





end