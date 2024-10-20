package main

import (
	"fmt"
    "os"
    "os/exec"
	"time"
)

type Object struct {
	x         int
	y         int
	character rune
}

func clearScreen() {
	fmt.Print("\033[H\033[2J")
}

func render(grid [][]rune) {
	for _, row := range grid {
		fmt.Println(string(row))
	}
}

func move(x, y int, obj *Object, grid [][]rune) {
	// Clear the old position
	grid[obj.x][obj.y] = ' '
	// Update the object's position
    obj.x = x
    obj.y = y
	// Place the object at the new position
	grid[obj.x][obj.y] = obj.character
}


func Update(code_to_run string) {
    backUpdate(code_to_run)
    clearScreen()
}

func main() {
	// Initialize the grid
	grid := [][]rune{
		{' ', ' ', ' ', ' ', ' ', ' ', ' '},
		{' ', ' ', ' ', ' ', ' ', ' ', ' '},
		{' ', ' ', ' ', ' ', ' ', ' ', ' '},
		{' ', ' ', ' ', ' ', ' ', ' ', ' '},
		{' ', ' ', ' ', ' ', ' ', ' ', ' '},
		{' ', ' ', ' ', ' ', ' ', ' ', ' '},
		{' ', ' ', ' ', ' ', ' ', ' ', ' '},
	}
	
	// Initialize the object 'h'
	h := Object{1, 1, 'h'} 
    x := 0
    y := 0

	for h.x < 6 { // Ensure it doesn't go out of bounds
		render(grid)
		move(x, y, &h, grid) // Pass the object by reference
		time.Sleep(1 * time.Second)
        x++ 
        y++
        clearScreen()
	}
}
