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
		assert '${x}' == '123.4567'
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
		assert 0 !in arr
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
			Rgba32_Component: Rgba32_Component{
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

fn sum(a ...int) int {
	mut total := 0
	for x in a {
		total += x
	}
	return total
}

fn test_sum() {
	assert sum(1, 2, 3, 5, 8) == 19
	assert sum(...[1, 2, 3, 5, 8]) == 19
}

const golden_ratio = 1.61803

fn test_const() {
	assert test.golden_ratio == 1.61803
}

struct Dog {
mut:
	breed string
}

struct Cat {
	breed string
}

fn (d Dog) speak() string {
	return 'woof'
}

fn (c Cat) speak() string {
	return 'meow'
}

interface Speaker {
	breed string
	speak() string
}

fn test_interface() {
	mut arr := []Speaker{}
	arr << Dog{'Leonberger'}
	arr << Cat{'Siamese'}

	assert 'a ${arr[0].breed} says: ${arr[0].speak()}' == 'a Leonberger says: woof'
	assert 'a ${arr[1].breed} says: ${arr[1].speak()}' == 'a Siamese says: meow'
}

interface Speaker2 {
	breed string
}

fn (s Speaker2) speak() string {
	return 'foooo'
}

fn test_interface_method() {
	dog := Dog{'Leonberger'}

	assert dog.speak() == 'woof'
	assert Speaker2(dog).speak() == 'foooo'
}

enum Color {
	@none
	red
	green
	blue
}

fn (c Color) cycle() Color {
	match c {
		.@none {
			return .@none
		}
		.red {
			return .green
		}
		.green {
			return .blue
		}
		.blue {
			return .red
		}
	}
}

fn test_enum() {
	assert int(Color.@none) == 0
	assert int(Color.red) == 1

	assert Color.@none.cycle() == Color.@none
	assert Color.red.cycle() == Color.green
}

type Animal = Cat | Dog

fn test_smart_casting() {
	{
		mut animal := Animal(Dog{'Leonberger'})

		if mut animal is Dog {
			assert typeof(animal).name == 'test.Dog'
		}

		assert typeof(animal).name == 'test.Animal'

		if mut animal is Dog {
			assert typeof(animal).name == 'test.Dog'

			animal.breed = 'abc'
		}

		assert typeof(animal).name == 'test.Animal'
		assert animal.breed == 'abc'
	}
	{
		mut animal := Animal(Dog{'Leonberger'})

		if animal is Dog {
			assert typeof(animal).name == 'test.Animal'
		}

		assert typeof(animal).name == 'test.Animal'

		if mut animal is Dog {
			assert typeof(animal).name == 'test.Dog'

			animal.breed = 'abc'
		}

		assert typeof(animal).name == 'test.Animal'
		assert animal.breed == 'abc'
	}
}

fn compare[T](a T, b T) int {
	if a < b {
		return -1
	}
	if a > b {
		return 1
	}
	return 0
}

fn test_generics() {
	assert compare(1, 1) == 0
	assert compare(1, 0) == 1
	assert compare(0, 1) == -1

	assert compare('0', 'a') == -1
}

fn twice(i int) int {
	return i * 2
}

fn test_thread() {
	mut threads := []thread int{}
	for i in 1 .. 5 {
		threads << spawn twice(i)
	}
	r := threads.wait()
	assert r == [2, 4, 6, 8]
}
