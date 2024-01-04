function diagonalDifference(arr) {
  // Write your code here
  let i = 0;
  let sumA = 0;
  let sumB = 0;
  console.log(arr[0][0]);
  while (i < arr[0][0]) {
    const line = arr[i + 1];
    console.log("line for " + i, line);
    sumA += line[i];
    console.log("sum a ", sumA);
    sumB += line[arr[0] - (i + 1)];
    console.log("sum b ", sumB);
    i++;
  }

  return Math.abs(sumA - sumB);
}

const input = [[3], [11, 2, 4], [4, 5, 6], [10, 8, -12]];

console.log(diagonalDifference(input));

function diagonalDifference(arr) {
  // Write your code here
  let i = 0;
  let sumA = 0;
  let sumB = 0;
  console.log(arr.length);
  while (i < arr.length) {
    const line = arr[i];
    console.log("line for " + i, line);
    sumA += line[i];
    console.log("sum a ", sumA);
    sumB += line[arr.length - (i + 1)];
    console.log("sum b ", sumB);
    i++;
  }

  return Math.abs(sumA - sumB);
}
