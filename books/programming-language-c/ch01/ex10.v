// Exercise 1-10. Write a program to copy its input to its output, replacing each tab by \t, each backspace by \b, and each backslash by \\. This makes tabs and backspaces visible in an unambiguous way.
// Kernighan, Brian W.. C Programming Language (p. 20). Pearson Education. Kindle Edition. 

fn main() {
	for c := C.getchar(); c != C.EOF; c = C.getchar() {
		if c == `\t` {
			print("\\t")
		} else if c == `\b` {
			print("\\b")
		} else if c == `\\` {
			print("\\\\")
		} else {
			C.printf("%c", c)
		}
	}
}


