// Exercise 2-3. Write the function htoi(s), which converts a string of hexadecimal digits (including an optional 0x or 0X) into its equivalent integer value. The allowable digits are 0 through 9, a through f, and A through F.
// Kernighan, Brian W.. C Programming Language (p. 46). Pearson Education. Kindle Edition.
fn test_htoi() {
	assert htoi('') == 0
	assert htoi('0') == 0
	assert htoi('9') == 9
	assert htoi('a') == 10
	assert htoi('f') == 15
	assert htoi('A') == 10
	assert htoi('F') == 15
	assert htoi('10') == 16
	assert htoi('0xa') == 10
	assert htoi('0Xa') == 10
	assert htoi('1Y0') == 256
}

fn htoi(hexadecimal string) int {
	if hexadecimal.len < 1 {
		return 0
	}
	mut ret := 0
	hex := if hexadecimal[0..1] == '0x' || hexadecimal[0..1] == '0X' {
		hexadecimal[2..]
	} else {
		hexadecimal
	}
	for i := 0; i < hex.len; i++ {
		digit := hex[i]
		if `0` <= digit && digit <= `9` {
			ret = 16 * ret + int(digit - `0`)
		} else if `a` <= digit && digit <= `f` {
			ret = 16 * ret + int(digit - `a` + 10)
		} else if `A` <= digit && digit <= `F` {
			ret = 16 * ret + int(digit - `A` + 10)
		} else {
			// Assume 0
			ret = 16 * ret
		}
	}
	return ret
}
