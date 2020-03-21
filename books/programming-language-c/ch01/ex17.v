// Exercise 1-17. Write a program to print all input lines that are longer than 80 characters.
// Kernighan, Brian W.. C Programming Language (p. 31). Pearson Education. Kindle Edition.
fn C.getline(voidptr, voidptr, voidptr) int

const (
	threshold = 80
)

fn main() {
	max := size_t(0)
	mut buf := charptr(0)
	for {
		nr_chars := C.getline(&buf, &max, stdin)
		if nr_chars == 0 || nr_chars == -1 {
			break
		}
		line := tos3(buf).trim_right('\n')
		if (line.len >= threshold ) {
			println('${line.len}: ${line}')
		}
	}
}
