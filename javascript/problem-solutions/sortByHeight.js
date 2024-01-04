
function sortByHeight(arr) {
  const people = arr.filter((t) => t != -1)
  console.log('people ', people)
  const sortedPeople = people.sort()
  console.log('sortedPeople ', sortedPeople)
//   const peopleWithTree = arr.map((h) => )
  const r = []
  let y = 0
  for(let x = 0; x < arr.length; x++) {
    if(arr[x] === -1) {
      r.push(-1)
    } else {
      r.push(sortedPeople[y])
      y += 1
    }
  }
  
  return r
}

console.log('sortByHeight ', sortByHeight([-1, 150, 190, 170, -1, -1, 160, 180]))
