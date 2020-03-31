// Exercise 3-5. Write the function itob(n,s,b) that converts the integer n into a base b character representation in the string s. In particular, itob(n,s,16) formats n as a hexadecimal integer in s.
// Kernighan, Brian W.. C Programming Language (p. 64). Pearson Education. Kindle Edition.
fn test_itob() {
	assert (itob(1, 2) == '1')
	assert (itob(2, 2) == '10')
	assert (itob(5, 8) == '5')
	assert (itob(9, 8) == '11')
	assert (itob(15, 16) == 'F')
	assert (itob(65535, 16) == 'FFFF')
	assert (itob(65535, 32) == '1VVV')
	assert (itob(65535, 36) == '1EKF')
}

fn itob(n, base u32) string {
	if 36 < base {
		panic('Not Supported base: $base')
	}
	mut ret := mod2base(n % base).str()
	mut m := n / base
	for ; m > 0; m /= base {
		ret = mod2base(m % base).str() + ret
	}
	return ret
}

fn mod2base(mod u32) byte {
	if mod < 10 {
		return byte(mod + `0`)
	}
	return byte(mod + `A` - 10)
}
