package routers

import (
	"travel-template/controllers"

	"github.com/beego/beego/v2/server/web"
)

func init() {
	web.Router("/", &controllers.MainController{})
	web.Router("/test", &controllers.TestController{})
}
