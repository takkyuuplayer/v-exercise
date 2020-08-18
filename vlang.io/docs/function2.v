fn foo() (int, int) {
	return 2, 3
}

fn main() {
	a, b := foo()
	println(a) // 2
	println(b) // 3
}
