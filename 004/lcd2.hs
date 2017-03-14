import Data.List
import Data.Char

lcdize :: String -> Int -> String
lcdize digits count =
    concat $ strings
    where strings       = map stringsForRow [0..4]
          stringsForRow = \row -> replicateJoin (if even row then 1 else count) $ stringForRow row ++ "\n"
          stringForRow  = \row -> joinWithSpace $ map (digitToRowOfLCD count row) digitArray
          digitArray    = map (\d -> ord d - 48 ) digits
          replicateJoin = \count -> concat . replicate count
          joinWithSpace = concat . intersperse " "
          digitToRowOfLCD count row digit =
            first ++ second ++ third
            where first  = [lcdDigits !! digit !! row !! 0]
                  second = concat $ replicate count [lcdDigits !! digit !! row !! 1]
                  third  = [lcdDigits !! digit !! row !! 2]
                  lcdDigits = [
                       [" _ ",
                        "| |",
                        "   ",
                        "| |",
                        " _ "],

                       ["   ",
                        "  |",
                        "   ",
                        "  |",
                        "   "],

                       [" _ ",
                        "  |",
                        " _ ",
                        "|  ",
                        " _ "],

                       [" _ ",
                        "  |",
                        " _ ",
                        "  |",
                        " _ "],

                       ["   ",
                        "| |",
                        " _ ",
                        "  |",
                        "   "],

                       [" _ ",
                        "|  ",
                        " _ ",
                        "  |",
                        " _ "],

                       [" _ ",
                        "|  ",
                        " _ ",
                        "| |",
                        " _ "],

                       [" _ ",
                        "  |",
                        "   ",
                        "  |",
                        "   "],

                       [" _ ",
                        "| |",
                        " _ ",
                        "| |",
                        " _ "],

                       [" _ ",
                        "| |",
                        " _ ",
                        "  |",
                        " _ "]
                   ]


main = do
  putStrLn $ lcdize "4242042" 5
