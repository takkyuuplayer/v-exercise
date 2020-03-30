// Exercise 3-2. Write a function escape(s,t) that converts characters like newline and tab into visible escape sequences like \n and \t as it copies the string t to s. Use a switch. Write a function for the other direction as well, converting escape sequences into the real characters.
// Kernighan, Brian W.. C Programming Language (p. 60). Pearson Education. Kindle Edition.
fn test_escape_unescape() {
	assert escape('	\n') == '\\t\\n'
	assert unescape('\\t\\n') == '\t\n'
	assert unescape(escape('	\n')) == '\t\n'
}

fn escape(from string) string {
	mut to := ''
	for letter in from {
		to += match letter {
			`\t`{
				'\\t'
			}
			`\n`{
				'\\n'
			}
			else {
				letter.str()}
	}
	}
	return to
}

fn unescape(from string) string {
	mut to := ''
	mut i := 0
	for i = 0; i < from.len; i++ {
		if from[i] == `\\` {
			i++
			if i == from.len {
				to += '\\'
				break
			}
			else if from[i] == `t` {
				to += '\t'
				continue
			}
			else if from[i] == `n` {
				to += '\n'
				continue
			}
			else {
				to += '\\${from[i].str()}'
			}
		}
		else {
			to += from[i].str()
		}
	}
	return to
}
