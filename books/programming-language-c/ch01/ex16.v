// Exercise 1-16. Revise the main routine of the longest-line program so it will correctly print the length of arbitrarily long input lines, and as much as possible of the text.
// Kernighan, Brian W.. C Programming Language (pp. 30-31). Pearson Education. Kindle Edition.
import os

fn main() {
	mut max_line := ''
	for line := os.get_raw_line(); line.len > 0; line = os.get_raw_line() {
		trimmed := line.trim_right('\n')
		if (trimmed.len > max_line.len) {
			max_line = trimmed
		}
	}
	println('$max_line.len: $max_line')
}
