package main

import (
	_ "travel-template/routers"

	"github.com/beego/beego/v2/server/web"
)

func main() {
	web.Run()
}
