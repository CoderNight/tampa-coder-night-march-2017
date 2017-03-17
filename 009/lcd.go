package main

import (
	"flag"
	"fmt"
	"strings"
)

var (
	size  = flag.Int("size", 2, "size of values")
	chars = map[string][]string{
		"0": []string{
			" - ",
			"| |",
			"   ",
			"| |",
			" - "},
		"1": []string{
			"   ",
			"  |",
			"   ",
			"  |",
			"   "},
		"2": []string{
			" - ",
			"  |",
			" - ",
			"|  ",
			" - "},
		"3": []string{" - ",
			"  |",
			" - ",
			"  |",
			" - "},
		"4": []string{"   ",
			"| |",
			" - ",
			"  |",
			"   "},
		"5": []string{" - ",
			"|  ",
			" - ",
			"  |",
			" - "},
		"6": []string{" - ",
			"|  ",
			" - ",
			"| |",
			" - "},
		"7": []string{" - ",
			"  |",
			"   ",
			"  |",
			"   "},
		"8": []string{" - ",
			"| |",
			" - ",
			"| |",
			" - "},
		"9": []string{" - ",
			"| |",
			" - ",
			"  |",
			"   "},
	}
)

func main() {
	flag.Parse()

	values := flag.Args()

	for _, value := range values {
		displayChars(value)
	}
}

func displayChars(value string) {
	chars := resizeChars(parseChars(value))
	size := len(chars[0])

	for i := 0; i < size; i++ {
		for _, char := range chars {
			fmt.Printf("%s ", char[i])
		}
		fmt.Printf("\n")
	}
}

func parseChars(value string) [][]string {
	result := [][]string{}
	for _, char := range strings.Split(value, "") {
		res, ok := chars[char]
		if !ok {
			panic(fmt.Sprintf("Unable to handle non numbers: %s", char))
		}
		result = append(result, res)
	}

	return result
}

func resizeChars(chars [][]string) [][]string {
	for i, charMap := range chars {
		chars[i] = resizeChar(charMap)
	}
	return chars
}

func resizeChar(char []string) []string {
	result := []string{}
	for _, row := range char {
		if strings.Contains(row, "-") {
			replacement := strings.Repeat("-", *size)
			row = strings.Replace(row, "-", replacement, 1)
		} else {
			replacement := strings.Repeat(" ", *size)
			row = strings.Replace(row, " ", replacement, 1)
		}

		if strings.Contains(row, "|") {
			for i := 1; i < *size; i++ {
				result = append(result, row)
			}
		}
		result = append(result, row)

	}

	return result
}
