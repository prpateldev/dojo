// [7,1,2,3,9]
// The solution should find the max area

// time: O(n^2)
function findMaxArea(arr) {
  const len = arr.length;
  let maxArea = 0;
  for (let ai = 0; ai < len; ai++) {
    for (let bi = ai + 1; bi < len; bi++) {
      let area = Math.min(arr[ai], arr[bi]) * (bi - ai)
      if (maxArea < area) {
        maxArea = area;
      }
    }
  }
  return maxArea;
}

console.log(
  "it must return 28 for input [7,1,2,3,9]",
  findMaxArea([7, 1, 2, 3, 9])
);

// Better logic
// time: O(n)
function getMaxArea(heights) {
  let p1 = 0;
  let p2 = heights.length - 1;
  let maxArea = 0;
  while (p1 < p2) {
    const height = Math.min(heights[p1], heights[p2]);
    const width = p2 - p1;
    const area = height * width;
    maxArea = Math.max(maxArea, area);

    if (heights[p1] <= heights[p2]) {
      p1 += 1;
    } else {
      p2 -= 1;
    }
  }

  return maxArea;
}

console.log(
  "it must return 28 for input [7,1,2,3,9] getMaxArea",
  getMaxArea([7, 1, 2, 3, 9])
);
console.log(
  "it must return 32 for input [4, 8, 1, 2, 3, 9] getMaxArea",
  getMaxArea([4, 8, 1, 2, 3, 9])
);
