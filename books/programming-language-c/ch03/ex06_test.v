// Exercise 3-6. Write a version of itoa that accepts three arguments instead of two. The third argument is a minimum field width; the converted number must be padded with blanks on the left if necessary to make it wide enough.
// Kernighan, Brian W.. C Programming Language (p. 64). Pearson Education. Kindle Edition.
fn test_itoa() {
	assert itoa2(-32768, 10) == '    -32768'
	assert itoa2(32767, 10) == '     32767'
	assert itoa2(32767, 2) == '32767'
}

fn itoa2(n i16, len int) string {
	sign := if n < 0 { '-' } else { '' }
	mod := n % 10
	mut ret := if mod < 0 { byte(-mod + `0`).str() } else { byte(mod + `0`).str() }
	mut m := if mod < 0 { -n / 10 } else { n / 10 }
	for ; m > 0; m /= 10 {
		ret = byte(m % 10 + `0`).str() + ret
	}
	ret = sign + ret
	if len > ret.len {
		return ' '.repeat(len - ret.len) + ret
	}
	return ret
}
