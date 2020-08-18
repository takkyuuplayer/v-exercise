// Exercise 1-18. Write a program to remove trailing blanks and tabs from each line of input, and to delete entirely blank lines.
// Kernighan, Brian W.. C Programming Language (p. 31). Pearson Education. Kindle Edition.
import os

fn main() {
	for line := os.get_raw_line(); line.len > 0; line = os.get_raw_line() {
		trimmed := line.trim_right('\n \t')
		println(trimmed)
	}
}
