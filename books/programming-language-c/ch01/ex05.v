// Exercise 1-5. Modify the temperature conversion program to print the table in reverse order, that is, from 300 degrees to 0.
// Kernighan, Brian W.. C Programming Language (p. 14). Pearson Education. Kindle Edition.
fn main() {
	C.printf('  F      C\n')
	for fahr := 300.0; fahr >= 0; fahr -= 20 {
		celsius := (5.0 / 9.0) * (fahr - 32)
		C.printf('%3.0f %6.1f\n', fahr, celsius)
	}
}
