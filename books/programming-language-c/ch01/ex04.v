fn main() {
	mut celsius := -20.0
	C.printf("  C      F\n")
	for(celsius <= 100) {
		fahr := celsius * (9.0 / 5.0) + 32
		C.printf("%3.0f %6.1f\n", celsius, fahr)
		celsius += 5
	}
}