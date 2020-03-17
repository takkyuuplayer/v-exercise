fn main() {
	C.printf("  F      C\n")
	for fahr := 300.0; fahr >= 0; fahr -= 20 {
		celsius := (5.0 / 9.0) * (fahr - 32)
		C.printf("%3.0f %6.1f\n", fahr, celsius)
	}
}
