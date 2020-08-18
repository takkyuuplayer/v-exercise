// Exercise 2-4. Write an alternate version of squeeze(s1,s2) that deletes each character in s1 that matches any character in the string s2.
// Kernighan, Brian W.. C Programming Language (p. 48). Pearson Education. Kindle Edition.
fn test_squeeze() {
	assert squeeze('a', 'a') == ''
	assert squeeze('a', 'b') == 'a'
	assert squeeze('ab', 'b') == 'a'
	assert squeeze('cba', 'ab') == 'c'
}

fn squeeze(s1, s2 string) string {
	mut to_remove := map[string]bool{}
	for i := 0; i < s2.len; i++ {
		to_remove[s2[i].str()] = true
	}
	mut ret := ''
	for i := 0; i < s1.len; i++ {
		if !(s1[i].str() in to_remove) {
			ret += s1[i].str()
		}
	}
	return ret
}
