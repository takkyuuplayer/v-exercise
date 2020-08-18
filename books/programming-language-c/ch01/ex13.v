// Exercise 1-13. Write a program to print a histogram of the lengths of words in its input. It is easy to draw the histogram with the bars horizontal; a vertical orientation is more challenging.
// Kernighan, Brian W.. C Programming Language (p. 24). Pearson Education. Kindle Edition.
import strings

const (
	max_length = 200
)

fn main() {
	mut word_lengthes := [0].repeat(max_length)
	mut length := 0
	for c := C.getchar(); c != C.EOF; c = C.getchar() {
		if c != ` ` && c != `\n` && c != `\t` {
			length++
		} else if length > 0 {
			if length > max_length {
				word_lengthes[max_length - 1]++
			} else {
				word_lengthes[length - 1]++
			}
			length = 0
		}
	}
	for i, count in word_lengthes {
		println('${i+1}: ' + strings.repeat(`-`, count))
	}
}
