// Exercise 3-4. In a two’s complement number representation, our version of itoa does not handle the largest negative number, that is, the value of n equal to −(2wordsize−1). Explain why not. Modify it to print that value correctly, regardless of the machine on which it runs.
// Kernighan, Brian W.. C Programming Language (p. 64). Pearson Education. Kindle Edition. 
fn test_itoa() {
	assert itoa(-32768) == '-32768'
}

fn itoa(n i16) string {
	sign := if n < 0 { '-' } else { '' }
	mod := n % 10
	mut ret := if mod < 0 { byte(-mod + `0`).str() } else { byte(mod + `0`).str() }
	mut m := if mod < 0 { -n / 10 } else { n / 10 }
	for ; m > 0; m /= 10 {
		ret = byte(m % 10 + `0`).str() + ret
	}
	return sign + ret
}
