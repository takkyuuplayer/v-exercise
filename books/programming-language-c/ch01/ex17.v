// Exercise 1-17. Write a program to print all input lines that are longer than 80 characters.
// Kernighan, Brian W.. C Programming Language (p. 31). Pearson Education. Kindle Edition.
import os

const (
	threshold = 80
)

fn main() {
	for line := os.get_raw_line(); line.len > 0; line = os.get_raw_line() {
		trimmed := line.trim_right('\n')
		if (trimmed.len >= threshold) {
			println('$trimmed.len: $trimmed')
		}
	}
}
