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

struct Abc {
	val string
}

struct Xyz {
	foo string
}

type Alphabet = Abc | Xyz

struct MyStruct {
	x int
}

struct MyStruct2 {
	y string
}

type MySumType = MyStruct | MyStruct2

fn test_sum_type() {
	{
		// is operator
		x := Alphabet(Abc{'test'})
		assert x is Abc
		assert x !is Xyz
	}
	{
		// match operator
		x := Alphabet(Abc{'test'})
		match x {
			Abc {
				assert true
			}
			Xyz {
				assert false
			}
		}
	}
	{
		mut x := MySumType(MyStruct{123})
		if x is MyStruct {
			assert typeof(x).name == 'test.MySumType'
		}
		if mut x is MyStruct {
			assert typeof(x).name == 'test.MyStruct'
		}
	}
}

fn test_match() {
	{
		// comma
		c := `v`
		ret := match c {
			`a`, `b` { false }
			`v` { true }
			else { false }
		}
		assert ret
	}
	{
		// range
		c := `v`
		ret := match c {
			`a`...`n` { false }
			`o`...`x` { true }
			else { false }
		}
		assert ret
	}
}

struct Widget {
mut:
	x int
	y int = 9
}

struct Button {
	Widget
	title string
}

fn test_struct() {
	{
		// default value
		button := Button{}

		assert button == Button{Widget{0, 9}, ''}
	}
	{
		// embedding
		mut button := Button{
			title: 'Click me'
		}
		button.x = 3

		assert button == Button{Widget{3, 9}, 'Click me'}
	}
	{
		// function arguments
		new_button := fn (c Widget) &Button {
			return &Button{c, 'Click Me'}
		}
		button := new_button(x: 9)

		assert button == Button{Widget{9, 9}, 'Click Me'}
	}
	{
		// spread operator
		w1 := Widget{1, 2}
		w2 := Widget{
			...w1
			x: 100
		}
		assert w2 == Widget{100, 2}
	}
}

struct Rgba32_Component {
	r byte
	g byte
	b byte
	a byte
}

union Rgba32 {
	Rgba32_Component
	value u32
}

fn test_union() {
	{
		// size
		assert 4 == sizeof(Rgba32_Component)
		assert 4 == sizeof(Rgba32)
	}
	{
		clr1 := Rgba32{
			value: 0x008811FF
		}
		unsafe {
			assert clr1.value == 0x008811FF
			assert clr1.a == 0
		}
		clr2 := Rgba32{
			Rgba32_Component: {
				a: 128
			}
		}
		unsafe {
			assert clr2.a == 128
		}
	}
}

fn square(mut ints []int) {
	for i, v in ints {
		ints[i] *= v
	}
}

fn test_function() {
	{
		// mutable arguments
		mut nums := [1, 2, 3]
		square(mut nums)

		assert nums == [1, 4, 9]
	}
}
