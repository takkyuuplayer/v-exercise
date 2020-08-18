// Exercise 2-6. Write a function setbits(x,p,n,y) that returns x with the n bits that begin at position p set to the rightmost n bits of y, leaving the other bits unchanged.
// Kernighan, Brian W.. C Programming Language (p. 49). Pearson Education. Kindle Edition.
fn test_setbits() {
	assert setbits(0b11, 1, 1, 0b0) == 0b01
	assert setbits(0b10101010, 5, 3, 0b11100011) == 0b10011010
	assert setbits(0b10101010, 5, 4, 0b11100011) == 0b10001110
}

fn setbits(x, p, n, y int) int {
	return (x & ((~0 << p + 1) | ~(~0 << n))) | ((y & ~(~0 << n)) << p + 1 - n)
}
