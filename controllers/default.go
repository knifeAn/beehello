package controllers

import (
	"fmt"
	"github.com/astaxie/beego"
	"beehello/models"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	//c.Data["Website"] = "beego.me"
	//c.Data["Email"] = "astaxie@gmail.com"
	c.TplName = "index.html"
	//fmt.Println("beego 欢迎你")
}

func (c *MainController) QueryUser() {
	name:= c.GetString("name")
	usermsg, _ := models.GetUserMsg(name)
	c.Data["ID"] = usermsg.ID
	c.Data["Name"] = usermsg.Name
	c.Data["Password"] = usermsg.Password
	c.TplName = "query.html"
}
func (c *MainController) AddUser() {
	var user models.User
	c.ParseForm(&user)
	//logs.Info("用户信息",user.Name, user.Password)
	addUser, err := models.AddUser(user)
	if err!=nil {
		fmt.Println("添加失败")
	}
	c.Data["ID"] = addUser.ID
	c.Data["Name"] = addUser.Name
	c.Data["Password"] = addUser.Password
	c.TplName = "query.html"
}
