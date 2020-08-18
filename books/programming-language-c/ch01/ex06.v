// Exercise 1-6. Verify that the expression getchar() != EOF is 0 or 1.
// Kernighan, Brian W.. C Programming Language (p. 17). Pearson Education. Kindle Edition.
fn main() {
	mut c := 0
	for c = C.getchar(); c != C.EOF; c = C.getchar() {
		println(c != C.EOF)
	}
	println(c != C.EOF)
}
