require_relative 'lcd_converter'

LcdConverter.print(*ARGV.map(&:to_i))
