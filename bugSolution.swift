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

//Corrected function to properly modify the array passed as an argument
func correctModifyArray(array: inout [Int]) -> [Int] {
    for i in 0..<array.count {
        array[i] *= 2
    }
    return array
}

var correctedArray = newArray
correctModifyArray(array: &correctedArray)
print(correctedArray) // Output: [8, 16, 24, 32, 40]