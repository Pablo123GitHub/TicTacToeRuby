class Grid

  attr_reader(:answers_array)

  ARRAY_WIN_SEQUENCE = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8],[0,4,8], [2,4,6] ]

  def initialize
    @answers_array = Array.new(9, "")
  end

  def records(index, cross_or_nought)
      index_int = index.to_i
      raise 'Game is finished please start a new game !' unless @answers_array.include? ''
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
    ARRAY_WIN_SEQUENCE.each do |arr|
      return true if three_symbols_aligned(arr)
    end
    false
  end

  def record_human_and_computer_choices(index)
    records(index, "X")
    lengthArrIndexEmpty = empty_indexes_in_array.length
    randomNumber = rand(0..lengthArrIndexEmpty-1)
    records(empty_indexes_in_array[randomNumber], "O")
    records(empty_indexes_in_array[0], "X") if empty_indexes_in_array.length == 1
  end

  private


  def empty_indexes_in_array
    arrResult = []
    @answers_array.each_with_index do |el,index|
      arrResult.push(index.to_i) if el.length == 0
    end
    arrResult
  end


  def three_symbols_aligned(arr)
    is_the_same(@answers_array[arr[0]], @answers_array[arr[1]] ) && is_the_same(@answers_array[arr[1]], @answers_array[arr[2]])
  end

  def has_one_empty_value(input1, input2)
     input1.empty? || input2.empty?
  end

  def is_the_same(input1,input2)
    has_one_empty_value(input1,input2) ? false : input1==input2
  end

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