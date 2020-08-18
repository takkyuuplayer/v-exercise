// Exercise 1-23. Write a program to remove all comments from a C program. Don’t forget to handle quoted strings and character constants properly. C comments do not nest.
// Kernighan, Brian W.. C Programming Language (p. 34). Pearson Education. Kindle Edition.
fn main() {
	mut in_double_quote := false
	mut in_single_quote := false
	mut in_line_comment := false
	mut in_comment := false
	mut prev := C.EOF
	for c := C.getchar(); c != C.EOF; c = C.getchar() {
		if in_line_comment {
			if c == `\n` {
				in_line_comment = false
				prev = C.EOF
				println('')
			}
			continue
		}
		if in_comment {
			if prev == `*` && c == `/` {
				in_comment = false
				prev = C.EOF
				continue
			}
			prev = c
			continue
		}
		if in_double_quote {
			if prev != C.EOF {
				C.printf('%c', prev)
			}
			if prev == `\\` && c == `\\` {
				C.printf('%c', c)
				prev = C.EOF
				continue
			} else if prev != `\\` && c == `"` {
				in_double_quote = false
				C.printf('%c', c)
				prev = C.EOF
				continue
			}
			prev = c
			continue
		}
		if in_single_quote {
			if prev != C.EOF {
				C.printf('%c', prev)
			}
			if prev == `\\` && c == `\\` {
				C.printf('%c', c)
				prev = C.EOF
				continue
			} else if prev != `\\` && c == `\'` {
				in_single_quote = false
				C.printf('%c', c)
				prev = C.EOF
				continue
			}
			prev = c
			continue
		}
		if prev == `/` && c == `/` {
			in_line_comment = true
			continue
		}
		if prev == `/` && c == `*` {
			in_comment = true
			continue
		}
		if prev != C.EOF {
			C.printf('%c', prev)
		}
		if c == `"` {
			in_double_quote = true
			prev = c
			continue
		}
		if c == `\'` {
			in_single_quote = true
			prev = c
			continue
		}
		prev = c
	}
	if prev != C.EOF {
		C.printf('%c', prev)
	}
}
