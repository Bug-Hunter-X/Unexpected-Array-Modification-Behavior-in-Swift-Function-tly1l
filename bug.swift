let someArray = [1, 2, 3, 4, 5]

func modifyArray(array: inout [Int]) {
    for i in 0..<array.count {
        array[i] *= 2
    }
}

modifyArray(array: &someArray)
print(someArray) // Output: [2, 4, 6, 8, 10]

func modifyArray2(array: [Int]) -> [Int] {
    var newArray = array
    for i in 0..<newArray.count {
        newArray[i] *= 2
    }
    return newArray
}

let newArray = modifyArray2(array: someArray)
print(newArray) // Output: [4, 8, 12, 16, 20]

//The error is in the following function, specifically in how it handles the array parameter and what it returns.  The compiler will not alert you to the mistake, but the output is not what is intended.
func brokenModifyArray(array: [Int]) -> [Int] {
    for i in 0..<array.count {
        array[i] *= 2
    }
    return array
}

let brokenArray = brokenModifyArray(array: newArray)
print(brokenArray) // Output: [4, 8, 12, 16, 20]

//The issue is that arrays in Swift are passed by value, not by reference unless specified with inout.  The function modifies a copy of the array and then attempts to return it.  However, this copy is not the original array that was passed in. Thus, it incorrectly returns the original unmodified array.