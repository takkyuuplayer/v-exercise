fn main() {
	mut c := 0
	for c = C.getchar(); c != C.EOF; c = C.getchar() {
		println(c != C.EOF)
	}
	println(c != C.EOF)
}