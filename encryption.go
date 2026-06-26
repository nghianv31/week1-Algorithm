package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strings"
)

/*
 * Complete the 'encryption' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts STRING s as parameter.
 */

func encryption(s string) string {
    input := strings.ReplaceAll(s," ","")
    L := len(input);
    if L == 0 {
        return ""
    }
	lower,upper := sqrtBounds(float64(L))
	if lower * upper < L {
		lower = upper
	}
	result := make([]byte,0)
	for i:= 0; i< upper; i++ {
		for j:=0; j<lower;j++{
			if j*upper+i < L {
				result = append(result,input[j*upper+i])
			}
		}
		result = append(result, ' ')
	}
	return string(result)
}

func main() {
    reader := bufio.NewReaderSize(os.Stdin, 16 * 1024 * 1024)

    stdout, err := os.Create(os.Getenv("OUTPUT_PATH"))
    checkError(err)

    defer stdout.Close()

    writer := bufio.NewWriterSize(stdout, 16 * 1024 * 1024)
	// reader := bufio.NewReader(strings.NewReader("feedthedog"))
    // writer := bufio.NewWriter(os.Stdout)

    s := readLine(reader)

    result := encryption(s)

    fmt.Fprintf(writer, "%s\n", result)

    writer.Flush()
}

func readLine(reader *bufio.Reader) string {
    str, _, err := reader.ReadLine()
    if err == io.EOF {
        return ""
    }

    return strings.TrimRight(string(str), "\r\n")
}

func checkError(err error) {
    if err != nil {
        panic(err)
    }
}
func sqrt(n float64) float64 {
    if n < 0 {
        return -1 // không xử lý số âm
    }
    if n == 0 {
        return 0
    }

    // Giá trị khởi tạo
    x := n
    // Lặp Newton-Raphson
    for i := 0; i < 20; i++ {
        x = 0.5 * (x + n/x)
    }
    return x
}
func sqrtBounds(n float64) (int, int) {
    root := sqrt(n)
    lower := int(root) // ép xuống
    upper := lower
    if float64(lower)*float64(lower) < n {
        upper = lower + 1
    }
    return lower, upper
}