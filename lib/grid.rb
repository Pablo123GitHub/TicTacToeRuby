class Grid

  attr_reader(:answers_array)

  def initialize
    @answers_array = Array.new(9, "")
  end

  def records(index, cross_or_nought)
    raise 'Invalid index' unless (0..8).include?(index)
    raise 'Index spot already taken' unless @answers_array[index].empty?
    @answers_array[index] = cross_or_nought
  end

  def display_grid()
    build_grid()
  end


  private

  def build_grid()
    return (
    first_line() + second_line() + third_line()
    )
  end

  def first_line
    "   #{@answers_array[0]} | #{@answers_array[1]}  | #{@answers_array[2]}  " + "
 ---+---+---"
  end

  def second_line
    "
   #{@answers_array[3]} | #{@answers_array[4]}  | #{@answers_array[5]}  " + "
 ---+---+--- "
  end

  def third_line
    "
   #{@answers_array[6]} | #{@answers_array[7]}  | #{@answers_array[8]}  "
  end



end