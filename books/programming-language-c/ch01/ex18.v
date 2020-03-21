// Exercise 1-18. Write a program to remove trailing blanks and tabs from each line of input, and to delete entirely blank lines.
// Kernighan, Brian W.. C Programming Language (p. 31). Pearson Education. Kindle Edition. 

fn C.getline(voidptr, voidptr, voidptr) int

fn main() {
	max := size_t(0)
	mut buf := charptr(0)
	for {
		nr_chars := C.getline(&buf, &max, stdin)
		if nr_chars == 0 || nr_chars == -1 {
			break
		}
		line := tos3(buf).trim_right('\n \t')
		println(line)
	}
}
