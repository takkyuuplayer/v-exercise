import json

struct Foo {
	degree string
}

struct User {
	name string
	age  int
	// Use the `skip` attribute to skip certain fields
	foo Foo
	// If the field name is different in JSON, it can be specified
	last_name string [json: lastName]
}

fn main() {
	data := '{ "name": "Frodo", "lastName": "Baggins", "age": 15}'
	user := json.decode(User, data) or {
		eprintln('Failed to decode json')
		return
	}
	println(user.name)
	println(user.last_name)
	println(user.age)
	println(user.foo)
}
