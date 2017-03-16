# Ruby Quiz 14 - LCD Numbers
# Tampa.rb Coder Night 3/16/2017
#
# Eric Wilson
# ericwilson29@gmail.com
class LCD
  DEFAULT_SIZE = 2

  def initialize(args)
    params = parse_args(args)
    @size = params[:size] || DEFAULT_SIZE
    @input_string = params[:input_string] || ''
    @output_array = []
  end

  def plot_digits
    input_digits = @input_string.scan /\d/
    input_digits.each do |digit|
      plot(digit)
    end
    puts @output_array
  end

  private

  def usage
    puts 'Usage: ruby lcd.rb [-s size] input'
    puts '  size must be an integer'
    puts '  input must be a string of digits'
    exit(-1)
  end

  def parse_args(args)
    values = {}
    unless args.length == 1 || args.length == 3
      usage
    end

    if args.length == 3
      size_string = nil
      if args[0] == '-s'
        size_string = args[1]
        values[:input_string] = args[2]
      elsif args[1] == '-s'
        size_string = args[2]
        values[:input_string] = args[0]
      end
      
      unless size_string 
        usage
      end

      unless size_string.match /^[0-9]+$/
        puts 'Size must be an integer'
        exit(-1)
      end

      values[:size] = Integer(size_string)
    else
      values[:input_string] = args[0]
    end

    unless values[:input_string].match /^[0-9]+$/
      puts "Input string must contain only digits"
      exit(-1)
    end

    values
  end

  def horiz_bar(char_array)
    char_array << " #{'-' * @size} "
  end

  def horiz_space(char_array)
    char_array << " #{' ' * @size} "
  end

  def vert_bars(char_array)
    @size.times do
      char_array << "|#{' ' * @size}|"
    end
  end

  def left_vert_bar(char_array)
    @size.times do
      char_array << "|#{' ' * @size} "
    end
  end

  def right_vert_bar(char_array)
    @size.times do
      char_array << " #{' ' * @size}|"
    end
  end

  def space(char_array)
    for i in 0..char_array.size-1 do
      char_array[i] += ' '
    end
  end

  def append_to_output(char_array)
    if @output_array.size == 0
      @output_array = Array.new(char_array.size){ '' }
    else
      space(@output_array)
    end
    for i in 0..@output_array.size-1 do
      @output_array[i] += char_array[i]
    end
  end

  def zero
    char_array = []
    horiz_bar         char_array
    vert_bars         char_array
    horiz_space       char_array
    vert_bars         char_array
    horiz_bar         char_array
    append_to_output  char_array
  end

  def one
    char_array = []
    horiz_space       char_array
    right_vert_bar    char_array
    horiz_space       char_array
    right_vert_bar    char_array
    horiz_space       char_array
    append_to_output  char_array
  end

  def two
    char_array = []
    horiz_bar         char_array
    right_vert_bar    char_array
    horiz_bar         char_array
    left_vert_bar     char_array
    horiz_bar         char_array
    append_to_output  char_array
  end

  def three
    char_array = []
    horiz_bar         char_array
    right_vert_bar    char_array
    horiz_bar         char_array
    right_vert_bar    char_array
    horiz_bar         char_array
    append_to_output  char_array
  end

  def four
    char_array = []
    horiz_space       char_array
    vert_bars         char_array
    horiz_bar         char_array
    right_vert_bar    char_array
    horiz_space       char_array
    append_to_output  char_array
  end

  def five
    char_array = []
    horiz_bar         char_array
    left_vert_bar     char_array
    horiz_bar         char_array
    right_vert_bar    char_array
    horiz_bar         char_array
    append_to_output  char_array
  end

  def six
    char_array = []
    horiz_bar         char_array
    left_vert_bar     char_array
    horiz_bar         char_array
    vert_bars         char_array
    horiz_bar         char_array
    append_to_output  char_array
  end

  def seven
    char_array = []
    horiz_bar         char_array
    right_vert_bar    char_array
    horiz_space       char_array
    right_vert_bar    char_array
    horiz_space       char_array
    append_to_output  char_array
  end

  def eight
    char_array = []
    horiz_bar         char_array
    vert_bars         char_array
    horiz_bar         char_array
    vert_bars         char_array
    horiz_bar         char_array
    append_to_output  char_array
  end

  def nine
    char_array = []
    horiz_bar         char_array
    vert_bars         char_array
    horiz_bar         char_array
    right_vert_bar    char_array
    horiz_space       char_array
    append_to_output  char_array
  end

  def plot(digit)
    case digit
    when '0'
      zero
    when '1'
      one
    when '2'
      two
    when '3'
      three
    when '4'
      four
    when '5'
      five
    when '6'
      six
    when '7'
      seven
    when '8'
      eight
    when '9'
      nine
    else
      puts 'not implemented'
    end
  end
end

lcd = LCD.new(ARGV)
lcd.plot_digits