# Requires https://github.com/rylnd/shpec

library=./lcd
source "${BASH_SOURCE%/*}/$library" 2>/dev/null || source "$library"
unset -v library

describe defa
  it "creates an array from a heredoc"
    defa samples <<'EOS'
one
two
EOS
    expected='declare -a samples='\''([0]="one" [1]="two")'\'
    assert equal "$expected" "$(declare -p samples)"
  end
end

describe zero
  it "prints row 1"
    assert equal ' - ' "$(zero 1 1)"
  end

  it "prints row 2"
    assert equal '| |' "$(zero 2 1)"
  end

  it "prints row 3"
    assert equal '   ' "$(zero 3 1)"
  end

  it "prints row 4"
    assert equal '| |' "$(zero 4 1)"
  end

  it "prints row 5"
    assert equal ' - ' "$(zero 5 1)"
  end

  it "prints row 1 at size 2"
    assert equal ' -- ' "$(zero 1 2)"
  end

  it "prints row 2 at size 2"
    assert equal '|  |' "$(zero 2 2)"
  end

  it "prints row 3 at size 2"
    assert equal '    ' "$(zero 3 2)"
  end

  it "prints row 4 at size 2"
    assert equal '|  |' "$(zero 4 2)"
  end

  it "prints row 5 at size 2"
    assert equal ' -- ' "$(zero 5 2)"
  end
end

describe one
  it "prints row 1"
    assert equal '   ' "$(one 1 1)"
  end

  it "prints row 2"
    assert equal '  |' "$(one 2 1)"
  end

  it "prints row 3"
    assert equal '   ' "$(one 3 1)"
  end

  it "prints row 4"
    assert equal '  |' "$(one 4 1)"
  end

  it "prints row 5"
    assert equal '   ' "$(one 5 1)"
  end

  it "prints row 1 at size 2"
    assert equal '    ' "$(one 1 2)"
  end

  it "prints row 2 at size 2"
    assert equal '   |' "$(one 2 2)"
  end

  it "prints row 3 at size 2"
    assert equal '    ' "$(one 3 2)"
  end

  it "prints row 4 at size 2"
    assert equal '   |' "$(one 4 2)"
  end

  it "prints row 5 at size 2"
    assert equal '    ' "$(one 5 2)"
  end
end

describe two
  it "prints row 1"
    assert equal ' - ' "$(two 1 1)"
  end

  it "prints row 2"
    assert equal '  |' "$(two 2 1)"
  end

  it "prints row 3"
    assert equal ' - ' "$(two 3 1)"
  end

  it "prints row 4"
    assert equal '|  ' "$(two 4 1)"
  end

  it "prints row 5"
    assert equal ' - ' "$(two 5 1)"
  end

  it "prints row 1 at size 2"
    assert equal ' -- ' "$(two 1 2)"
  end

  it "prints row 2 at size 2"
    assert equal '   |' "$(two 2 2)"
  end

  it "prints row 3 at size 2"
    assert equal ' -- ' "$(two 3 2)"
  end

  it "prints row 4 at size 2"
    assert equal '|   ' "$(two 4 2)"
  end

  it "prints row 5 at size 2"
    assert equal ' -- ' "$(two 5 2)"
  end
end

describe three
  it "prints row 1"
    assert equal ' - ' "$(three 1 1)"
  end

  it "prints row 2"
    assert equal '  |' "$(three 2 1)"
  end

  it "prints row 4"
    assert equal '  |' "$(three 4 1)"
  end

  it "prints row 5"
    assert equal ' - ' "$(three 5 1)"
  end

  it "prints row 1 at size 2"
    assert equal ' -- ' "$(three 1 2)"
  end

  it "prints row 2 at size 2"
    assert equal '   |' "$(three 2 2)"
  end

  it "prints row 3 at size 2"
    assert equal ' -- ' "$(three 3 2)"
  end

  it "prints row 4 at size 2"
    assert equal '   |' "$(three 4 2)"
  end

  it "prints row 5 at size 2"
    assert equal ' -- ' "$(three 5 2)"
  end
end

describe four
  it "prints row 1"
    assert equal '   ' "$(four 1 1)"
  end

  it "prints row 2"
    assert equal '| |' "$(four 2 1)"
  end

  it "prints row 3"
    assert equal ' - ' "$(four 3 1)"
  end

  it "prints row 4"
    assert equal '  |' "$(four 4 1)"
  end

  it "prints row 5"
    assert equal '   ' "$(four 5 1)"
  end

  it "prints row 1 at size 2"
    assert equal '    ' "$(four 1 2)"
  end

  it "prints row 2 at size 2"
    assert equal '|  |' "$(four 2 2)"
  end

  it "prints row 3 at size 2"
    assert equal ' -- ' "$(four 3 2)"
  end

  it "prints row 4 at size 2"
    assert equal '   |' "$(four 4 2)"
  end
  it "prints row 5 at size 2"
    assert equal '    ' "$(four 5 2)"
  end
end

describe five
  it "prints row 1"
    assert equal ' - ' "$(five 1 1)"
  end

  it "prints row 2"
    assert equal '|  ' "$(five 2 1)"
  end

  it "prints row 3"
    assert equal ' - ' "$(five 3 1)"
  end

  it "prints row 4"
    assert equal '  |' "$(five 4 1)"
  end

  it "prints row 5"
    assert equal ' - ' "$(five 5 1)"
  end

  it "prints row 1 at size 2"
    assert equal ' -- ' "$(five 1 2)"
  end

  it "prints row 2 at size 2"
    assert equal '|   ' "$(five 2 2)"
  end

  it "prints row 3 at size 2"
    assert equal ' -- ' "$(five 3 2)"
  end

  it "prints row 4 at size 2"
    assert equal '   |' "$(five 4 2)"
  end
  it "prints row 5 at size 2"
    assert equal ' -- ' "$(five 5 2)"
  end
end

describe six
  it "prints row 1"
    assert equal ' - ' "$(six 1 1)"
  end

  it "prints row 2"
    assert equal '|  ' "$(six 2 1)"
  end

  it "prints row 3"
    assert equal ' - ' "$(six 3 1)"
  end

  it "prints row 4"
    assert equal '| |' "$(six 4 1)"
  end

  it "prints row 5"
    assert equal ' - ' "$(six 5 1)"
  end

  it "prints row 1 at size 2"
    assert equal ' -- ' "$(six 1 2)"
  end

  it "prints row 2 at size 2"
    assert equal '|   ' "$(six 2 2)"
  end

  it "prints row 3 at size 2"
    assert equal ' -- ' "$(six 3 2)"
  end

  it "prints row 4 at size 2"
    assert equal '|  |' "$(six 4 2)"
  end

  it "prints row 5 at size 2"
    assert equal ' -- ' "$(six 5 2)"
  end
end

describe seven
  it "prints row 1"
    assert equal ' - ' "$(seven 1 1)"
  end

  it "prints row 2"
    assert equal '  |' "$(seven 2 1)"
  end

  it "prints row 3"
    assert equal '   ' "$(seven 3 1)"
  end

  it "prints row 4"
    assert equal '  |' "$(seven 4 1)"
  end

  it "prints row 5"
    assert equal '   ' "$(seven 5 1)"
  end

  it "prints row 1 at size 2"
    assert equal ' -- ' "$(seven 1 2)"
  end

  it "prints row 2 at size 2"
    assert equal '   |' "$(seven 2 2)"
  end

  it "prints row 3 at size 2"
    assert equal '    ' "$(seven 3 2)"
  end

  it "prints row 4 at size 2"
    assert equal '   |' "$(seven 4 2)"
  end

  it "prints row 5 at size 2"
    assert equal '    ' "$(seven 5 2)"
  end
end

describe alias_pdr
  it "calls a function with an argument of the calling function's name"; (
    stub_command print_digit_row 'echo "$1"'
    func () { alias_pdr "$@" ;}
    assert equal func "$(func one two)"
    return "$_shpec_failures" ); (( _shpec_failures += $? )) ||:
  end
end

describe expand
  it "prints the middle character once"
    assert equal '- -' "$(expand '- -' 1)"
  end

  it "prints the middle character twice"
    assert equal '-  -' "$(expand '- -' 2)"
  end
end

describe print_digit_row
  it "prints the first row of two"
    assert equal ' - ' "$(print_digit_row two 1 1)"
  end

  it "prints the first row of two of size 2"
    assert equal ' -- ' "$(print_digit_row two 1 2)"
  end
end

describe print_digits
  it "prints a row of digits"
    IFS=$'\n' read -rd '' expected <<'EOS' ||:
 -     
| |   |
       
| |   |
 -     
EOS
    assert equal "$expected" "$(print_digits '01' 1)"
  end

  it "prints a row of digits at size two"
    IFS=$'\n' read -rd '' expected <<'EOS' ||:
 --      
|  |    |
|  |    |
         
|  |    |
|  |    |
 --      
EOS
    assert equal "$expected" "$(print_digits '01' 2)"
  end
end

describe print_row
  it "prints the first row of a series of digits"
    assert equal ' -     ' "$(print_row '01' 1 1)"
  end

  it "prints the second row of a series of digits"
    assert equal '| |   |' "$(print_row '01' 2 1)"
  end

  it "prints the first row of a series of digits at size 2"
    assert equal ' --      ' "$(print_row '01' 1 2)"
  end
end

describe print_rows
  it "prints the first row of a series of digits"
    assert equal ' -     ' "$(print_rows '01' 1 1)"
  end

  it "prints the second row of a series of digits"
    assert equal '| |   |' "$(print_rows '01' 2 1)"
  end

  it "prints the second row of a series of digits at size 2"
    assert equal $'|  |    |\n|  |    |' "$(print_rows '01' 2 2)"
  end
end

describe print_times
  it "prints a space two times"
    assert equal '  ' "$(print_times ' ' 2)"
  end

  it "prints a space three times"
    assert equal '   ' "$(print_times ' ' 3)"
  end
end
