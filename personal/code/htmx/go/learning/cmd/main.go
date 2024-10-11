package main

import (
    "html/template"
    "io"

    "github.com/labstack/echo/v4"
    "github.com/labstack/echo/v4/middleware"
)

type Templates struct { 
    templates *template.Template
}

func (t *Templates) Render(w io.Writer, name string, data interface{}, c echo.Context) error {
    return t.templates.ExecuteTemplate(w, name, data)
}

func newTemplate() *Templates {
    return &Templates {
        templates: template.Must(template.ParseGlob("client/*.html")),
    }
}

type Todo struct {
    thing string
    done bool
}

func newTodo(Thing string, Done bool) Todo {
    return Todo{
        thing: Thing,
        done: Done,
    }
}

func main() {

    e := echo.New()
    e.Use(middleware.Logger())

    todo := newTodo("exercise", false)
    e.Renderer = newTemplate()

    e.GET("/", func(c echo.Context) error {
        return c.Render(200, "index", todo)
    })

    e.Logger.Fatal(e.Start(":42069"))
}
