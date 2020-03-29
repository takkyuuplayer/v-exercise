// Exercise 1-21. Write a program entab that replaces strings of blanks by the minimum number of tabs and blanks to achieve the same spacing. Use the same tab stops as for detab. When either a tab or a single blank would suffice to reach a tab stop, which should be given preference?
// Kernighan, Brian W.. C Programming Language (p. 34). Pearson Education. Kindle Edition.
const (
	tabstop = 4
)

fn main() {
	mut space_count := 0
	mut colmuns := 0
	for c := C.getchar(); c != C.EOF; c = C.getchar() {
		if c == ` ` {
			space_count++
			continue
		}
		if c == `\t` {
			current_tab_size := tabstop - (colmuns + space_count) % tabstop
			space_count += current_tab_size
			continue
		}
		current_tab_size := tabstop - colmuns % tabstop
		if space_count < current_tab_size {
			print(' '.repeat(space_count))
			colmuns += space_count
			space_count = 0
		}
		else {
			print('\t')
			colmuns += current_tab_size
			space_count -= current_tab_size
			print('\t'.repeat(space_count / tabstop))
			print(' '.repeat(space_count % tabstop))
			colmuns += space_count
			space_count = 0
		}
		C.printf('%c', c)
		colmuns++
		if c == `\n` {
			colmuns = 0
		}
	}
}
