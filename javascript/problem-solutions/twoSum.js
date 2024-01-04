//  0  1  2  3  4
// [1, 3, 7, 9, 2] = 11 => [3,4]
/**
 * 
 * @param {number[]} nums 
 * @param {number} target 
 * It should return indexes of two numbers from the given array which sums up to the given target value.
 * If not found any match it will return null
 * O(N^2)
 */

function twoSum(nums, target) {
  const len = nums.length
  for(let p1 = 0; p1 < len; p1++) {
    const numberTofind = target - nums[p1]
    for(let p2 = p1; p2 < len; p2++) {
      if(nums[p2] === numberTofind) {
        return [p1, p2]
      }
    }
  }
  return null
}


/**
 * 
 * @param {number[]} nums 
 * @param {number} target 
 * It should return indexes of two numbers from the given array which sums up to the given target value.
 * If not found any match it will return null
 * O(log n)
 */

function twoSumBetterApproach(nums, target) {
  const len = nums.length
  const hm = {}
  for(let p1 = 0; p1 < len; p1++) {
    if(hm.hasOwnProperty(nums[p1])) {
      return [hm[nums[p1]], p1]
    }
    const numberToFind = target - nums[p1]
    hm[numberToFind] = p1
  }
  return null
}

console.log("it should return [3,4]", twoSum([1,3,7,9,2], 11))
console.log("it should return null if empty array passed", twoSum([], 11))
console.log("it should return null if there is only one element in the array", twoSum([1], 11))
console.log("it should return null if there is no match found", twoSum([1, 2, 3], 11))
console.log("--------------------------------------------------------")
console.log("it should return [3,4] through better approach", twoSumBetterApproach([1,3,7,9,2], 4))
console.log("it should return null if empty array passed through better approach", twoSumBetterApproach([], 11))
console.log("it should return null if there is only one element in the array through better approach", twoSumBetterApproach([1], 11))
console.log("it should return null if there is no match found through better approach", twoSumBetterApproach([1, 2, 3], 11))

