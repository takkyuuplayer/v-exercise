fn main() {
	mut prev := C.EOF
	for c := C.getchar(); c != C.EOF; c = C.getchar() {
		if prev == ` ` && c == ` ` {
			continue
		}
		C.printf("%c", c)
		prev = c
	}
}

