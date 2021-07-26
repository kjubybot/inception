package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.ListenAndServe(":80", http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		html := `<!DOCTYPE HTML>
<html>
<head>
	<title>Got cats?</title>
	<style>
		div {
			max-width: 600px;
			margin: 20px auto;
		}
		h3 {
			text-align: center;
			font-family: sans-serif;
		}
	</style>
</head>
<body>
	<div>
		<img src="https://cataas.com/cat"/>
	</div>
	<div>
		<h3>Будь котиком, поставь 125 :3</h3>
	</div>
</body>
</html>`
		fmt.Fprint(w, html)
	}))
}
