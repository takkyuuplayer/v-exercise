// Exercise 3-1. Our binary search makes two tests inside the loop, when one would suffice (at the price of more tests outside). Write a version with only one test inside the loop and measure the difference in run-time.
// Kernighan, Brian W.. C Programming Language (p. 58). Pearson Education. Kindle Edition.
import rand
import benchmark

fn test_binsearch() {
	mut v := [0]
	rand.seed(100)
	for i in 1 .. 10000000 {
		if rand.next(4) == 0 {
			v << i
		}
	}
	mut test_cases := []int
	for i in 1 .. 100 {
		test_cases << rand.next(v.len)
	}
	mut bench := benchmark.new_benchmark()
	for test_case in test_cases {
		binsearch(test_case, v)
	}
	bench.stop()
	bench.measure('binseach')
	mut bench2 := benchmark.new_benchmark()
	for test_case in test_cases {
		binsearch2(test_case, v)
	}
	bench2.stop()
	bench2.measure('binseach2')
}

fn binsearch(x int, v []int) int {
	mut low := 0
	mut high := v.len - 1
	mut mid := 0
	for (low <= high) {
		mid = (low + high) / 2
		if (x < v[mid]) {
			high = mid - 1
		}
		else if (x > v[mid]) {
			low = mid + 1
		}
		else {
			return mid
		}
	}
	return if x == v[mid] { mid } else { -1 }
}

fn binsearch2(x int, v []int) int {
	mut low := 0
	mut high := v.len - 1
	mut mid := (low + high) / 2
	for (low <= high && v[mid] != x) {
		if (x < v[mid]) {
			high = mid - 1
		}
		else if (x > v[mid]) {
			low = mid + 1
		}
		mid = (low + high) / 2
	}
	return if x == v[mid] { mid } else { -1 }
}
