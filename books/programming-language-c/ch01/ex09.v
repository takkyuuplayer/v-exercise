// Exercise 1-9. Write a program to copy its input to its output, replacing each string of one or more blanks by a single blank.
// Kernighan, Brian W.. C Programming Language (p. 20). Pearson Education. Kindle Edition.

fn main() {
	mut prev := C.EOF
	for c := C.getchar(); c != C.EOF; c = C.getchar() {
		if prev == ` ` && c == ` ` {
			continue
		}
		C.printf("%c", c)
		prev = c
	}
}

