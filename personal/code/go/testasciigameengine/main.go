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


func backUpdate(code_to_run string) error {
    // Create a temporary file to store the code
    tempFile, err := os.CreateTemp("", "temp_code.go")
    if err != nil {
        return fmt.Errorf("error creating temporary file: %w", err)
    }
    defer tempFile.Close()

    // Write the code to the temporary file
    actual_code_to_run := "render(grid)" + code_to_run
    _, err = tempFile.WriteString(actual_code_to_run)
    if err != nil {
        return fmt.Errorf("error writing code to temporary file: %w", err)
    }

    // Compile the code
    cmd := exec.Command("go", "build", "-o", "temp_executable", tempFile.Name())
    err = cmd.Run()
    if err != nil {
        return fmt.Errorf("error compiling code: %w", err)
    }

    // Execute the compiled code
    cmd = exec.Command("./temp_executable")
    err = cmd.Run()
    if err != nil {
        return fmt.Errorf("error executing code: %w", err)
    }

    return nil
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
