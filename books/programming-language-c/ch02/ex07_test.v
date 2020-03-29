// Exercise 2-7. Write a function invert(x,p,n) that returns x with the n bits that begin at position p inverted (i.e., 1 changed into 0 and vice versa), leaving the others unchanged.
// Kernighan, Brian W.. C Programming Language (p. 49). Pearson Education. Kindle Edition. 

fn test_invert() {
	assert invert(0b11111111, 5, 3) == 0b11000111
	assert invert(0b10101010, 5, 3) == 0b10010010
	assert invert(0b10101010, 3, 2) == 0b10100110
}

fn invert(x, p, n int) int {
	z := (~0 << p+1) | ~(~0 << n)
	return (x & z) | (~x & ~z)
}