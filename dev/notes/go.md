# How to write go code that receives parameters from stdin and files from cli?

To write Go code that receives parameters from standard input (stdin) and
handles file inputs from the command line interface (CLI), you can use the `os`
and `bufio` packages for reading input and command-line arguments respectively.
Below, I'll outline how to handle both scenarios in a single program.

## Step 1: Set Up Your Go Environment

Make sure you have Go installed on your machine. If it's not installed, you can
download and install it from [https://golang.org/dl/](https://golang.org/dl/).

## Step 2: Write the Go Code

Here's an example program that does the following:

- Reads parameters from standard input using `bufio.Scanner`.
- Accepts filenames as command-line arguments and reads contents from those files.

```
// go

package main

import (
    "bufio"
    "fmt"
    "os"
)

func main() {
    // Check if there are any command-line arguments (excluding the program name itself)
    if len(os.Args) > 1 {
        // Loop through all provided arguments (starting from index 1)
        for _, filename := range os.Args[1:] {
            // Open the file
            file, err := os.Open(filename)
            if err != nil {
                fmt.Printf("Error opening file %s: %v\n", filename, err)
                continue
            }
            defer file.Close()

            // Read the file
            scanner := bufio.NewScanner(file)
            fmt.Printf("Contents of %s:\n", filename)
            for scanner.Scan() {
                fmt.Println(scanner.Text())  // Output the content of the file
            }
            if err := scanner.Err(); err != nil {
                fmt.Printf("Error reading file %s: %v\n", filename, err)
            }
            fmt.Println()  // Print a newline for better separation between file contents
        }
    }

    // Read from stdin
    fmt.Println("Enter input (type 'exit' to quit):")
    stdinScanner := bufio.NewScanner(os.Stdin)
    for stdinScanner.Scan() {
        text := stdinScanner.Text()
        if text == "exit" {
            break
        }
        fmt.Println("You typed:", text)
    }
    if err := stdinScanner.Err(); err != nil {
        fmt.Printf("Error reading from stdin: %v\n", err)
    }
}
```

## Step 3: Build and Run Your Code

Save the code to a file named `main.go` and build it using the Go compiler:

```
// bash

go build main.go
```

This command will compile the code into an executable named `main` (or
`main.exe` on Windows).

## Step 4: Test the Program

You can run the program and pass file names as arguments:

```
// bash

./main file1.txt file2.txt
```

This command will read and display the contents of `file1.txt` and `file2.txt`.
You can also interact with the program via stdin by typing directly into the
terminal.

## Explanation

- **Command-line Arguments**: The program checks `os.Args`, which is a slice
containing the command-line arguments. The first element (`os.Args[0]`) is
always the path to the executable, so actual arguments start from `os.Args[1]`.
- **File Handling**: The program uses `os.Open` to open files and `bufio.Scanner`
to read them line by line.
- **Standard Input**: It uses another `bufio.Scanner` that reads from `os.Stdin`.
This allows the user to enter input directly into the terminal until the word
"exit" is entered.

This example provides a robust foundation for building CLI tools in Go that
require input from both files and stdin, making it versatile for various
scripting and data processing tasks.

# How to read from a file with go?

To read from a file in Go, you can use the `os` package to open the file,
and then use the `bufio` package for buffered I/O operations. Here is a
simple example of reading a file line by line in Go:

```
package main

import (
    "bufio"
    "fmt"
    "log"
    "os"
)

func main() {
    // Open the file for reading
    file, err := os.Open("example.txt")
    if err != nil {
        log.Fatalf("failed to open file: %v", err)
    }
    defer file.Close()

    // Create a new scanner to read from the file
    scanner := bufio.NewScanner(file)

    // Read the file line by line
    for scanner.Scan() {
        line := scanner.Text()
        fmt.Println(line)
    }

    // Check for any errors that occurred during scanning
    if err := scanner.Err(); err != nil {
        log.Fatalf("error scanning file: %v", err)
    }
}
```

In this example:

1. We open a file "example.txt" for reading using `os.Open`.
2. We create a new scanner using `bufio.NewScanner` to read from the file.
3. We loop through the file line by line using `scanner.Scan()` and retrieve
each line using `scanner.Text()`.
4. Finally, we check for any errors that may have occurred during the
scanning process.

Make sure to handle errors properly for file opening and scanning to ensure
your program behaves as expected.

