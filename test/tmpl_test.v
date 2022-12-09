fn foo() string {
	name := '<script>alert(1);</script>'
	return $tmpl('testdata/example.html')
}

fn test_html_tmpl() {
	html := foo()
	assert html == '<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width" />
    <title>Example</title>
  </head>
  <body>
    Hello, <script>alert(1);</script>
  </body>
</html>
'
}
