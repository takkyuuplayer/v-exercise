// Exercise 1-14. Write a program to print a histogram of the frequencies of different characters in its input.
// Kernighan, Brian W.. C Programming Language (p. 24). Pearson Education. Kindle Edition.
import strings

const (
	lower_bound = `a`
	upper_bound = `z`
)

fn main() {
	mut char_counts := [0].repeat(int(upper_bound - lower_bound + 1))
	mut nothers := 0
	for c := C.getchar(); c != C.EOF; c = C.getchar() {
		if lower_bound <= c && c <= upper_bound {
			char_counts[c - lower_bound]++
		} else {
			nothers++
		}
	}
	for i, count in char_counts {
		C.printf('%c: ', i + lower_bound)
		println(strings.repeat(`-`, count))
	}
	println("others: ${nothers}")
}
