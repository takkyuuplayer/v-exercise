// Exercise 1-16. Revise the main routine of the longest-line program so it will correctly print the length of arbitrarily long input lines, and as much as possible of the text.
// Kernighan, Brian W.. C Programming Language (pp. 30-31). Pearson Education. Kindle Edition.
fn C.getline(voidptr, voidptr, voidptr) int


fn main() {
	max := size_t(0)
	mut buf := charptr(0)
	mut max_line := ''
	for {
		nr_chars := C.getline(&buf, &max, stdin)
		if nr_chars == 0 || nr_chars == -1 {
			break
		}
		line := tos3(buf).trim_right('\n')
		
		if(line.len > max_line.len) {
			max_line = line
		}
	}
	println('${max_line.len}: ${max_line}')
}
