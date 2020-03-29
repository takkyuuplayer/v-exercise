// Exercise 2-9. In a two’s complement number system, x &= (x−1) deletes the rightmost 1-bit in x. Explain why. Use this observation to write a faster version of bitcount.
// Kernighan, Brian W.. C Programming Language (p. 51). Pearson Education. Kindle Edition. 

fn test_bitcount() {
	assert bitcount(11) == 3
	assert bitcount(11) == 3
}

fn bitcount(x u16) int {
	mut ret := x
	mut bit_count := 0
	for {
		if(ret == 0) {
			break
		}
		bit_count++
		ret &= (ret - 1)
	}
	return bit_count
}