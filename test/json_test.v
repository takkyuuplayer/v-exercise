module test

import os
import x.json2

fn test_json2_decode() ? {
	body := os.read_file('./test/testdata/go_through.json')?
	raw_json := json2.raw_decode(body)?
}
