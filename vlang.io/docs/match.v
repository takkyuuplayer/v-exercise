fn main() {
	os := 'windows'
	print('V is running on ')
	match os {
		'darwin' {
			println('macOS.')
		}
		'linux' {
			println('Linux.')
		}
		else {
			println('windows')
		}
	}
}
