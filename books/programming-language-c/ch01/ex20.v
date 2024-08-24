// Exercise 1-20. Write a program detab that replaces tabs in the input with the proper number of blanks to space to the next tab stop. Assume a fixed set of tab stops, say every n columns. Should n be a variable or a symbolic parameter?
// Kernighan, Brian W.. C Programming Language (p. 34). Pearson Education. Kindle Edition.
const tabstop = 4

fn main() {
	mut columns := 0
	for c := C.getchar(); c != C.EOF; c = C.getchar() {
		if c == `\t` {
			filling := tabstop - (columns % tabstop)
			print(' '.repeat(filling))
			columns += filling
		} else if c == `\n` {
			println('')
			columns = 0
		} else {
			C.printf('%c', c)
			columns++
		}
	}
}
