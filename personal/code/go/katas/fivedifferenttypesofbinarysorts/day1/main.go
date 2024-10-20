package main

import (
	"fmt"
	"math"
)

func main() {
    arr := [] int {1,2,3,4,5,6,7,8,9}
    fmt.Println(sort(arr, 9, 0, 8))
}

func sort(arr []int, target int, start int, end int) int {
    mid := int(math.Floor(float64(start + end) / 2))
    
    if start > end {
        return -1
    }
    if arr[mid] == target {
        return mid
    }

    if arr[mid] > target {
        return sort(arr, target, start, mid + 1)
    }

    if arr[mid] < target {
        return sort(arr, target, mid, end + 1)
    }

    return -1
}
