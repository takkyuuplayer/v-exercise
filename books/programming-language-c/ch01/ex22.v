// Exercise 1-22. Write a program to “fold” long input lines into two or more shorter lines after the last non-blank character that occurs before the n-th column of input. Make sure your program does something intelligent with very long lines, and if there are no blanks or tabs before the specified column.
// Kernighan, Brian W.. C Programming Language (p. 34). Pearson Education. Kindle Edition.
const (
	tabstop = 4
	max_length = 60
)

fn main() {
	mut colmuns := 0
	mut prev := C.EOF
	for c := C.getchar(); c != C.EOF; c = C.getchar() {
		if colmuns >= max_length - 1 && c != ` ` && c != `\t` {
			if prev == ` ` || prev == `\t` {
				println('')
			}
			else {
				println('-')
			}
			colmuns = 0
		}
		C.printf('%c', c)
		prev = c
		if c == `\t` {
			colmuns += tabstop - colmuns % tabstop
		}
		else if c == `\n` {
			colmuns = 0
		}
		else {
			colmuns++
		}
	}
}
