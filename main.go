package main

import (
	_ "beehello/routers"
	"fmt"
	"github.com/astaxie/beego"
)

func main() {
	fmt.Println("hello beego test3")
	beego.Run()
}

