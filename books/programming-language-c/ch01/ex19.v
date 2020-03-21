// Exercise 1-19. Write a function reverse(s) that reverses the character string s. Use it to write a program that reverses its input a line at a time.
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
		line := tos3(buf).trim_right('\n').reverse()
		println(line)
	}
}
