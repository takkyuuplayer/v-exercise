fn test_before() {
	assert 'abcdeabcde'.before('a') == ''
	assert 'abcdeabcde'.all_after('a') == 'bcdeabcde'
}
