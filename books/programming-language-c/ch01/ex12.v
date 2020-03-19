// Exercise 1-12. Write a program that prints its input one word per line.
// Kernighan, Brian W.. C Programming Language (pp. 21-22). Pearson Education. Kindle Edition.
const (
	out_word = 0
	in_word = 1
)

fn main() {
	mut state := out_word
	for c := C.getchar(); c != C.EOF; c = C.getchar() {
		if c != ` ` && c != `\n` && c != `\t` {
			state = in_word
			C.printf('%c', c)
		}
		else if state == in_word {
			C.printf('\n')
			state = out_word
		}
	}
}
