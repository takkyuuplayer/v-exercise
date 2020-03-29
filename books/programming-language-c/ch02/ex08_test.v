// Exercise 2-8. Write a function rightrot(x,n) that returns the value of the integer x rotated to the right by n bit positions.
// Kernighan, Brian W.. C Programming Language (pp. 49-50). Pearson Education. Kindle Edition.
fn test_rightrot() {
	assert rightrot(0b101010, 1) == 0b010101
	assert rightrot(23587, 3) == 0b0110101110000100
}

fn rightrot(x, n u16) int {
	return (x>>n) | ((x & ~(~0<<n))<<(16 - n))
}
