import Foundation


/**
Given a binary array, find the maximum number of consecutive 1s in the array.
Example: [1,1,0,1,1,1]
Output: 3
**/

func getMaxCount(arr: [Int]) -> Int {
    var currentStreak = 0
    var count = 0
    for num in arr {
        if num == 1 {
            count += 1
            currentStreak = max(count, currentStreak)
        } else {
            count = 0
        }
    }
    return currentStreak
}

getMaxCount(arr: [1,1,0,1,1,1,3,1,1,1,1,1])


/*
Given an array of size n, find the majority element. The majority element is the element that appears more than n/2 times. You may assume that the array is non-empty and the majority element always exist in the array
 Example:
 Input: [3,2,3]
 Output: 3
 
 Example 2:
 Input [2,2,1,1,1,2,2]
 Ouput: 2
*/

//Way1
func majority(_ arr: [Int]) -> Int {
    var majority = arr.first
    var counter = 0
    for item in arr {
        if item == majority {
            counter += 1
        } else {
            counter -= 1
        }
        
        if counter == 0 {
            majority = item
        }
    }
    return majority!
}
print(majority([2,2,1,1,1,2,2]))

//Way 2
func getMajority2(_ arr: [Int]) -> Int {
    var num = 0
    var maxCount = 0
    var numsDict = Dictionary<Int,Int>()
    
    for i in arr {
        if numsDict[i] != nil {
            numsDict[i]? += 1
            maxCount = max(maxCount, numsDict[i]!)
            num = numsDict[i]! >= maxCount ? i : num
        } else {
            numsDict[i] = 1
        }
    }
    
    return num
}

print(getMajority2([2,2,1,1,1,1,1,2,2]))

//Way 3
func getmajorityElement(arr: [Int]) -> Int {
    var element: Int?
    var count = 0
    
    for item in arr {
        let itemCount = getItemCount(item: item, arr: arr)
        if itemCount > count {
            count = itemCount
            element = item
        }
    }
    return element ?? 0
}

func getItemCount(item: Int, arr: [Int]) -> Int {
    var count = 0
    for val in arr {
        if item == val {
            count += 1
        }
    }
    return count
}

print(getmajorityElement(arr: [2,2,1,1,1,1,1,2,2]))

/*
 Given an integer array of size n, find all elements that appear more than [n/3] times.
 Example 1:
 Input: [3,2,3]
 Output: [3]
 
 Example 2:
 Input: [1,1,1,3,3,2,2,2]
 Output: [1,2]

*/

func getMaxElements(_ arr: [Int]) -> [Int] {
    var numsDict = Dictionary<Int,Int>()
    var result = [Int]()
    for i in arr {
        if let val = numsDict[i] {
            numsDict[i] = val + 1
        } else {
            numsDict[i] = 1
        }
    }
    
    for (key, val) in numsDict {
        if Double(val) >= Double(arr.count)/3.0 {
            result.append(key)
        }
    }
    
    return result
}

print(getMaxElements([1,1,1,3,3,2,2,2]))

/*
 Given an array of integers and an integer k, find out whether there are two distinct indices i and j in the array such that nums[i] = nums[j] and the absolute difference between i and j is  k
 */

func getDuplicateDistance(_ arr: [Int], _ k: Int) -> Bool {
    for i in 0..<arr.count-1 {
        print("Step \(i)")
        for j in i+1..<arr.count {
            if arr[i] == arr[j], abs(i - j) == k {
                print(i, j)
                return true
            }
        }
    }
    
    return false
}

print(getDuplicateDistance([1,2,3,1,2,3], 1))
