/*
Binary search is an algorithm; its input is a sorted list of elements. 
If an element you’re looking for is in that list, binary search returns the position
where it’s located. Otherwise, binary search returns null.

In general, for any list of n, binary search will take log2 n steps to run in the worst case,
whereas simple search will take n steps.
*/


function binarySearch(list, item) {
  console.log('binary search started with %s elements ', list.length)
  let low = 0
  let high = list.length - 1
  let steps = 0
  while(low <= high) {
    steps += 1
    const mid = Math.floor((low + high) / 2)
    const guess = list[mid]
    // console.log('mid is %s & guess is %s', mid, list[mid])
    if(guess == item) {
      console.log('total steps taken ', steps)
      return mid
    }

    if(guess > item) {
      high = mid - 1
    } else {
      low = mid + 1
    }
  }

  console.log('total steps taken ', steps)
  return null
}

function getList(length = 10){
  const arr = Array(length)
  for(let i =0; i < arr.length; i++) {
    arr[i] = i + 1
  }

  return arr
}

// const list = getList(100000000)
// console.log(binarySearch(list, 11))

const characters ='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
const arr = characters.split('')

console.log(binarySearch(arr, 3))

