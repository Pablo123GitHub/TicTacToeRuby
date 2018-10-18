class Grid

  attr_reader(:answers_array)

  def initialize
    @answers_array = Array.new(9, "")
  end

  def records(index, cross_or_nought)
      index_int = index.to_i
      raise 'input is not a number' unless is_integer(index)
      raise 'Invalid index' unless (0..8).include?(index_int)
      raise 'Index spot already taken' unless @answers_array[index_int].empty?
      @answers_array[index_int] = cross_or_nought
  end

  def display_grid
    build_grid
  end

  def is_full
    @answers_array.join().length == 9
  end

  def one_side_wins

  end


  private


  def is_integer(integer_input)
    begin
      true if Integer(integer_input)
    rescue
      raise 'input is not a number'
    end
  end

  def build_grid
    return (
    first_line() + second_line() + third_line()
    )
  end

  def first_line
    " #{output_element(0)} |#{output_element(1)} |#{output_element(2)}  " + "
 ---+---+---"
  end

  def second_line
    "
 #{output_element(3)} |#{output_element(4)} |#{output_element(5)}  " + "
 ---+---+--- "
  end

  def third_line
    "
 #{output_element(6)} |#{output_element(7)} |#{output_element(8)}  "
  end

  def output_element(index)
    @answers_array[index].empty? ? ( "  #{@answers_array[index]}") : " #{@answers_array[index]}"
  end
end