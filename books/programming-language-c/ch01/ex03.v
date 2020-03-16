fn main() {
	mut fahr := 0.0
	C.printf("  F      C\n")
	for(fahr <= 300) {
		celsius := (fahr - 32) * (5.0 / 9.0)
		C.printf("%3.0f %6.1f\n", fahr, celsius)
		fahr += 20
	}
}