package routers

import (
	"beehello/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})
	beego.Router("/query", &controllers.MainController{}, "Post:QueryUser")
	beego.Router("/add", &controllers.MainController{}, "Post:AddUser")
}
