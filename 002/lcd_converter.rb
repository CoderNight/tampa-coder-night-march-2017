class LcdConverter
  DIGIT_TO_LCD = {
    0 => {
      top: "-", top_mid: 3, mid: " ", bot_mid: 3, bottom: "-"
    },
    1 => {
      top: " ", top_mid: 2, mid: " ", bot_mid: 2, bottom: " "
    },
    2 => {
      top: "-", top_mid: 2, mid: "-", bot_mid: 1, bottom: "-"
    },
    3 => {
      top: "-", top_mid: 2, mid: "-", bot_mid: 2, bottom: "-"
    },
    4 => {
      top: " ", top_mid: 3, mid: "-", bot_mid: 2, bottom: " "
    },
    5 => {
      top: "-", top_mid: 1, mid: "-", bot_mid: 2, bottom: "-"
    },
    6 => {
      top: "-", top_mid: 1, mid: "-", bot_mid: 3, bottom: "-"
    },
    7 => {
      top: "-", top_mid: 2, mid: " ", bot_mid: 2, bottom: " "
    },
    8 => {
      top: "-", top_mid: 3, mid: "-", bot_mid: 3, bottom: "-"
    },
    9 => {
      top: "-", top_mid: 3, mid: "-", bot_mid: 2, bottom: " "
    },
  }

  def self.print(number, scalar=2)
    digits = number.to_s.chars.map(&:to_i)
    sections = build_sections(scalar)
    sections.each do |section|
      case section
      when :top, :mid, :bottom
        puts digits.map{ |digit| build_horizontal(DIGIT_TO_LCD[digit][section], scalar) }
        .join(' ')
      else
        puts digits.map{ |digit| build_vertical(DIGIT_TO_LCD[digit][section], scalar) }
        .join(' ')
      end
    end
  end

  private
  def self.build_sections(scalar)
    sections = [:top]
    sections += Array(1..scalar).fill(:top_mid)
    sections << :mid
    sections += Array(1..scalar).fill(:bot_mid)
    sections << :bottom
  end

  def self.build_horizontal(char, scalar)
    " #{char * scalar} "
  end

  def self.build_vertical(option, scalar)
    filler = " " * scalar
    case option
    when 0
      " #{filler} "
    when 1
      "|#{filler} "
    when 2
      " #{filler}|"
    when 3
      "|#{filler}|"
    else
      "bad input"
    end
  end
end
