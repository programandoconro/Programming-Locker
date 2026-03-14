package main

import (
	"fmt"
	"log"

	"github.com/mattn/go-tty"
)

func main() {
	options := []string{"apple", "banana", "orange", "grape"}
	selected := 0

	tty, err := tty.Open()
	if err != nil {
		log.Fatal(err)
	}
	defer tty.Close()

	clearScreen := func() {
		fmt.Print("\033[H\033[2J") // Clear screen
	}

	printMenu := func() {
		clearScreen()
		fmt.Println("Select an option with ↑ ↓ and Enter:")
		for i, opt := range options {
			if i == selected {
				// Highlight selected line with green background
				fmt.Printf("\033[30;42m%s\033[0m\n", opt) // black text, green background
			} else {
				fmt.Println("  " + opt)
			}
		}
	}

	printMenu()

	for {
		r, err := tty.ReadRune()
		if err != nil {
			log.Fatal(err)
		}

		switch r {
		case 'q':
			fmt.Println("Exiting.")
			return
		case 13: // Enter key
			fmt.Println("You selected:", options[selected])
			return
		case 27: // escape sequence (arrow keys start with 27)
			seq := make([]rune, 2)
			seq[0], _ = tty.ReadRune()
			seq[1], _ = tty.ReadRune()
			if seq[0] == 91 { // '['
				switch seq[1] {
				case 65: // up arrow
					if selected > 0 {
						selected--
					}
				case 66: // down arrow
					if selected < len(options)-1 {
						selected++
					}
				}
			}
		}
		printMenu()
	}
}
