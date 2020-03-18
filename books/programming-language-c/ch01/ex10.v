fn main() {
	for c := C.getchar(); c != C.EOF; c = C.getchar() {
		if c == `\t` {
			print("\\t")
		} else if c == `\b` {
			print("\\b")
		} else if c == `\\` {
			print("\\\\")
		} else {
			C.printf("%c", c)
		}
	}
}


