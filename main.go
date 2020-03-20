package main

import (
	"fmt"
	"github.com/astaxie/beego"
	_ "beehello/routers"
)

func main() {
	fmt.Println("hello beego test3")
	beego.Run()
}

