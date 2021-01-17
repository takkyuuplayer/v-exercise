// Exercise 2-5. Write the function any(s1,s2), which returns the first location in the string s1 where any character from the string s2 occurs, or −1 if s1 contains no characters from s2. (The standard library function strpbrk does the same job but returns a pointer to the location.)
// Kernighan, Brian W.. C Programming Language (p. 48). Pearson Education. Kindle Edition.
fn test_any() {
	assert f_any('a', '') == 0
	assert f_any('a', 'a') == 0
	assert f_any('a', 'ab') == -1
	assert f_any('xyzabc', 'ab') == 3
	assert f_any('xyzabc', 'bcx') == -1
}

fn f_any(s1 string, s2 string) int {
	if s2.len < 1 {
		return 0
	}
	for i := 0; i < s1.len; i++ {
		mut j := 0
		for j = 0; j < s2.len && i + j < s1.len; j++ {
			if s1[i + j] != s2[j] {
				break
			}
		}
		if j == s2.len {
			return i
		}
	}
	return -1
}
