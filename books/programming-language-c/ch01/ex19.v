// Exercise 1-19. Write a function reverse(s) that reverses the character string s. Use it to write a program that reverses its input a line at a time.
// Kernighan, Brian W.. C Programming Language (p. 31). Pearson Education. Kindle Edition. 

import os

fn main() {
	for line := os.get_raw_line(); line.len > 0; line = os.get_raw_line() {
		trimmed := line.trim_right('\n')
		println(trimmed.reverse())
	}
}

