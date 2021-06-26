module test

fn test_varialbe() {
	{
		// Swap
		mut a, mut b := 0, 1

		assert a == 0
		assert b == 1

		a, b = b, a

		assert a == 1
		assert b == 0
	}
}

fn test_string() {
	{
		// cast to int
		assert '42'.int() == 42
		assert 'a'.int() == 0
	}
	{
		// string interpolation
		x := 123.4567
		assert '$x' == '123.4567'
		assert '${x:4.2f}' == '123.46'
		assert '${x:10}' == '   123.457'
		assert '${int(x):-10}' == '123       '
		assert '${int(x):010}' == '0000000123'
	}
}

fn test_number() {
	{
		// _ as separator
		assert 1000 == 1_000
	}
}

fn test_array() {
	{
		// basic
		arr := [1, 2, 3]
		assert arr[0] == 1
		assert arr.len == 3
		assert arr.cap == 3
	}
	{
		// init for performance optimization
		arr := []int{len: 5, init: -1}
		assert arr[0] == -1
		assert arr.len == 5
		assert arr.cap == 5
	}
	{
		// operator in
		arr := [1, 2, 3]
		assert 1 in arr
		assert !(0 in arr)
	}
	{
		// methods
		nums := [1, 2, 3]

		nums_copy := nums.clone()
		assert nums_copy == nums

		even := nums.filter(it % 2 == 0)
		assert even == [2]
		odd := nums.filter(fn (it int) bool {
			return it % 2 == 1
		})
		assert odd.len == 2
	}
	{
		// array slice
		array_1 := [1, 2, 3, 4, 5]
		mut array_2 := [9, 8]
		array_2 << array_1[..3]
		assert array_2 == [9, 8, 1, 2, 3]

		array_2 << 7
		assert array_1 == [1, 2, 3, 4, 5]
		assert array_2 == [9, 8, 1, 2, 3, 7]
	}
	{
		// fixed size array
		mut fnums := [3]int{}
		fnums[0] = 1
		fnums[1] = 2
		fnums[2] = 3
		assert fnums == [1, 2, 3]!
	}
	{
		arr := [1, 2, 3]
		val := arr[999] or { 0 }
		assert val == 0
	}
}
