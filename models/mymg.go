package models

import (
	"database/sql"
	"errors"
	"github.com/astaxie/beego"
	_ "github.com/go-sql-driver/mysql"
)

var Db *sql.DB

type User struct {
	ID   int `json:"id"`
	Name     string `json:"name"`
	Password  string `json:"password"`
}


func init() {
	dbconn := beego.AppConfig.String("DBConn")
	db, err := sql.Open("mysql", dbconn)
	if err != nil {
		return
	}
	db.SetMaxOpenConns(2000)
	db.SetMaxIdleConns(0)
	db.Ping()
	Db = db
}

func Close() {
	if Db != nil {
		Db.Close()

	}

}

func AddUser(rec User) (User, error) {
	//logs.Info("开始添加用户信息",rec.ID,rec.Name,rec.Password)
	var isql = "INSERT user SET id=?,name=?,password=?"
	response := User{rec.ID,rec.Name,rec.Password}
	if Db == nil {
		return response, errors.New("connect mysql failed")
	}
	stmt, _ := Db.Prepare(isql)
	defer stmt.Close()
	beego.Informational("Add rec=%#v", rec)
	_, err := stmt.Exec(rec.ID,rec.Name,rec.Password)
	if err == nil {
		response.Name = rec.Name
		response.Password = rec.Password
		return response, nil
	}

	return response, nil
}

func GetUserMsg(name string) (User, error) {
	var qsql = "SELECT * FROM user WHERE  name=?"
	var response User
	if name != "" {
		if Db == nil {
			return response, errors.New("connect mysql failed")
		}
		stmt, _ := Db.Prepare(qsql)
		rows, err := stmt.Query(name)
		defer rows.Close()
		if err != nil {
			return response, err
		}
		//遍历
		for rows.Next() {
			err = rows.Scan(&response.ID, &response.Name, &response.Password)
			if err != nil {
				return response, err
			}
		}
		return response, nil
	}
	return response, errors.New("Request failed!")
}