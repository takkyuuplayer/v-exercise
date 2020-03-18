fn main() {
	mut c := 0
	mut new_lines := 0
	mut tabs := 0
	mut blanks := 0
	for c = C.getchar(); c != C.EOF; c = C.getchar() {
		if c == `\n` {
			new_lines++
		} else if c == ` ` {
			blanks++
		} else if c == `\t` {
			tabs++
		}
	}
	println("new_lines: ${new_lines}, tabs: ${tabs}, blanks: ${blanks}")
}
