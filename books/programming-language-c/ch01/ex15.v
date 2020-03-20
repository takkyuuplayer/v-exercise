// Exercise 1-15. Rewrite the temperature conversion program of Section 1.2 to use a function for conversion.
// Kernighan, Brian W.. C Programming Language (p. 27). Pearson Education. Kindle Edition. 

fn main() {
	mut fahr := 0.0
	C.printf("  F      C\n")
	for(fahr <= 300) {
		celsius := f2c(fahr)
		C.printf("%3.0f %6.1f\n", fahr, celsius)
		fahr += 20
	}
}

fn f2c(fahr f32) f32 {
	return (fahr - 32) * (5.0 / 9.0)
}