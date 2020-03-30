// Exercise 3-3. Write a function expand(s1,s2) that expands shorthand notations like a-z in the string s1 into the equivalent complete list abc...xyz in s2. Allow for letters of either case and digits, and be prepared to handle cases like a-b-c and a-z0−9 and -a-z. Arrange that a leading or trailing - is taken literally.
// Kernighan, Brian W.. C Programming Language (p. 63). Pearson Education. Kindle Edition.
fn test_expand() {
	assert expand('a-b') == 'ab'
	assert expand('a-c') == 'abc'
	assert expand('a-b-c') == 'abc'
	assert expand('a-z0-9') == 'abcdefghijklmnopqrstuvwxyz0123456789'
	assert expand('-a-c') == '-abc'
	assert expand('-a-c-') == '-abc-'
	assert expand('5-9') == '56789'
	assert expand('2-5-9') == '23456789'
	assert expand('2-5-9') == '23456789'
}

fn expand(s string) string {
	if s.len < 3 {
		return s
	}
	mut i := 0
	mut expanded := ''
	for i = 0; i < s.len; i++ {
		expanded += s[i].str()
		if i + 2 == s.len {
			expanded += s[i + 1].str()
			break
		}
		if i + 1 == s.len {
			break
		}
		if s[i + 1] != `-` {
			continue
		}
		from := s[i]
		to := s[i + 2]
		if (`0` <= from && from <= `9` && `0` <= to && to <= `9`) || (`a` <= from && from <= `z` && `a` <= to && to <= `z`) || (`A` <= from && from <= `Z` && `A` <= to && to <= `Z`) {
			direction := if from <= to { 1 } else { -1 }
			for j := s[i] + direction; j != to; j += direction {
				expanded += j.str()
			}
		}
		else {
			expanded += s[i + 1].str()
		}
		i++
	}
	return expanded
}
