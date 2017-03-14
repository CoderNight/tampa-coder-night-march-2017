using System;
using System.Text.RegularExpressions;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LCD
{
    class LCD
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter Command (Console.NumToLCD) or -1 to exit");

            string input = Console.ReadLine();

            while (input != "-1")
            {
                if (Validate(input))
                {
                    List<string> numbers = GetNumbers(input);
                    int size = GetSize(input);

                    WriteNumbers(numbers, size);
                }
                else
                {
                    Console.WriteLine("Unknown Command");
                }

                input = Console.ReadLine();
            }

        }

        static bool Validate(string input)
        {
            string defaultPattern = @"^Console.NumToLCD\s\d+$";
            string sizePattern = @"^Console.NumToLCD\s-s\s\d+\s\d+$";

            return (Regex.IsMatch(input, defaultPattern) || Regex.IsMatch(input, sizePattern));

        }

        static int GetSize(string input)
        {
            string pattern = @"-s\s\d+";
            char[] seporator = { ' ' };
            string[] result;
            int size = 2;

            if (Regex.IsMatch(input, pattern))
            {
                Match m = Regex.Match(input, pattern);

                result = m.ToString().Split(seporator);

                size = Convert.ToInt32(result[1]);
            }

            return size;
        }

        static List<string> GetNumbers(string input)
        {
            List<string> numbers = new List<string>();

            string pattern = @"\d+$";
            Match digits = Regex.Match(input, pattern);

            Match[] temp = Regex.Matches(digits.ToString(), @"\d").Cast<Match>().ToArray();

            foreach (Match m in temp)
                numbers.Add(m.ToString());


            return numbers;
        }

        static void WriteNumbers(List<string> numbers, int size)
        {
            StringBuilder sb = new StringBuilder();
            List<string> LCD = new List<string>();

            int lineNum = 1;
            int firstLine = 1;
            int midLine = size + 2;
            int maxLine = 3 + (size * 2);

            string message = string.Empty;
            string line = string.Empty;

            while (lineNum <= maxLine)
            {
                foreach (string num in numbers)
                {
                    if (num == "0")
                    {
                        if (lineNum == firstLine || lineNum == maxLine)
                            line += string.Format("{0} ", HorizontalLine(size));
                        else if (lineNum == midLine)
                            line += string.Format("{0} ", ClearHorizontalLine(size));
                        else
                            line += string.Format("{0} ", DualVerticalLines(size));
                    }
                    else if (num == "1")
                    {
                        if (lineNum == firstLine || lineNum == maxLine)
                            line += string.Format("{0} ", ClearHorizontalLine(size));
                        else if (lineNum == midLine)
                            line += string.Format("{0} ", ClearHorizontalLine(size));
                        else
                            line += string.Format("{0} ", RightVerticalLine(size));
                    }
                    else if (num == "2")
                    {
                        if (lineNum == firstLine || lineNum == maxLine)
                            line += string.Format("{0} ", HorizontalLine(size));
                        else if (lineNum == midLine)
                            line += string.Format("{0} ", HorizontalLine(size));
                        else if ((lineNum > firstLine) && (lineNum < midLine))
                            line += string.Format("{0} ", RightVerticalLine(size));
                        else
                            line += string.Format("{0} ", LeftVerticalLine(size));
                    }
                    else if (num == "3")
                    {
                        if (lineNum == firstLine || lineNum == maxLine || lineNum == midLine)
                            line += string.Format("{0} ", HorizontalLine(size));
                        else
                            line += string.Format("{0} ", RightVerticalLine(size));
                    }
                    else if (num == "4")
                    {
                        if (lineNum == firstLine || lineNum == maxLine)
                            line += string.Format("{0} ", ClearHorizontalLine(size));
                        else if (lineNum == midLine)
                            line += string.Format("{0} ", HorizontalLine(size));
                        else if ((lineNum >firstLine)&& (lineNum <midLine))
                            line += string.Format("{0} ", DualVerticalLines(size));
                        else
                            line += string.Format("{0} ", RightVerticalLine(size));
                    }
                    else if (num == "5")
                    {
                        if (lineNum == firstLine || lineNum == maxLine)
                            line += string.Format("{0} ", HorizontalLine(size));
                        else if (lineNum == midLine)
                            line += string.Format("{0} ", HorizontalLine(size));
                        else if ((lineNum > firstLine) && (lineNum < midLine))
                            line += string.Format("{0} ", LeftVerticalLine(size));
                        else
                            line += string.Format("{0} ", RightVerticalLine(size));
                    }
                    else if (num == "6")
                    {
                        if (lineNum == firstLine || lineNum == maxLine)
                            line += string.Format("{0} ", HorizontalLine(size));
                        else if (lineNum == midLine)
                            line += string.Format("{0} ", HorizontalLine(size));
                        else if ((lineNum > firstLine) && (lineNum < midLine))
                            line += string.Format("{0} ", LeftVerticalLine(size));
                        else
                            line += string.Format("{0} ", DualVerticalLines(size));
                    }
                    else if (num == "7")
                    {
                        if (lineNum == firstLine)
                            line += string.Format("{0} ", HorizontalLine(size));
                        else if (lineNum == midLine || lineNum == maxLine)
                            line += string.Format("{0} ", ClearHorizontalLine(size));
                        else
                            line += string.Format("{0} ", RightVerticalLine(size));
                    }
                    else if (num == "8")
                    {
                        if (lineNum == firstLine || lineNum == maxLine || lineNum == midLine)
                            line += string.Format("{0} ", HorizontalLine(size));
                        else
                            line += string.Format("{0} ", DualVerticalLines(size));
                    }
                    else if (num == "9")
                    {
                        if (lineNum == firstLine || lineNum == maxLine)
                            line += string.Format("{0} ", HorizontalLine(size));
                        else if (lineNum == midLine)
                            line += string.Format("{0} ", HorizontalLine(size));
                        else if ((lineNum > firstLine) && (lineNum < midLine))
                            line += string.Format("{0} ", DualVerticalLines(size));
                        else
                            line += string.Format("{0} ", RightVerticalLine(size));
                    }
                }

                Console.WriteLine(line);

                line = string.Empty;

                lineNum++;

            }

        }

        static string HorizontalLine(int size)
        {
            string line = string.Empty;

            line += " ";

            for (int i = 0; i < size; i++)
                line += "-";

            line += " ";

            return line;

        }

        static string LeftVerticalLine(int size)
        {
            string line = string.Empty;
            string space = string.Empty;

           for (int i = 0; i < size; i++)
                space += " ";


            line += string.Format("|{0} ", space);

            return line;
        }

        static string RightVerticalLine(int size)
        {
            string line = string.Empty;
            string space = string.Empty;

            space += " ";

            for (int i = 0; i < size; i++)
                space += " ";

            line += string.Format("{0}|", space);


            return line;
        }

        static string DualVerticalLines(int size)
        {
            string line = string.Empty;
            string space = string.Empty;

            for (int i = 0; i < size; i++)
                space += " ";

            line += string.Format("|{0}|", space);
            return line;
        }

        static string ClearHorizontalLine(int size)
        {
            string line = string.Empty;

            for (int i = 0; i < size; i++)
                line += " ";

            line += string.Format("  ");

            return line;
        }
    }
}

