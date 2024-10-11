package main

import (
    "fmt"
    "html/template"
    "net/http"
    "time"
)

func main() {
    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        if r.Method == "GET" {
            data := struct {
                Message string
            }{
                Message: "Hello, world!",
            }
            tmpl, err := template.ParseGlob("index.html")
            if err != nil {
                http.Error(w, err.Error(), http.StatusInternalServerError)
                return
            }
            tmpl.Execute(w, data)
        } else {
            w.Write([]byte("Sorry, GET only!"))
        }
    })

    http.HandleFunc("/time", func(w http.ResponseWriter, r *http.Request) {
        if r.Method == "POST" {
            w.Write([]byte("Current time: " + time.Now().Format(time.RFC1123)))
        } else {
            w.Write([]byte("Sorry, POST only!"))
        }
    })

    fmt.Println("Started http server on port :8080")
    http.ListenAndServe(":8080", nil)
}
