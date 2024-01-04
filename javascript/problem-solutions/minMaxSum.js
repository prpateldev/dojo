/*
Example
input = [1,3,5,7,9]
is 16 24
*/

function minMaxSum(arr) {
  // Write your code here
  const allSum = arr.reduce((pv, cv) => {
    return pv + cv;
  }, 0);

  let minSum = null;
  let maxSum = null;

  for (let i = 0; i < arr.length; i++) {
    const sum = allSum - arr[i];
    if (maxSum === null) {
      maxSum = sum;
    }

    if (minSum === null) {
      minSum = sum;
    }

    maxSum = Math.max(maxSum, sum, minSum);
    minSum = Math.min(minSum, sum, maxSum);
  }

  return [minSum, maxSum];
}

console.log("minMaxSum ", minMaxSum([1, 2, 3, 4, 5]));

function minMaxSum2(arr) {
  const sorted = arr.sort((a, b) => a - b);
  let minSum = 0;
  let maxSum = 0;
  for (let i = 0; i < arr.length; i++) {
    if (i !== 0) {
      maxSum += arr[i];
    }

    if (i !== arr.length - 1) {
      minSum += arr[i];
    }
  }

  return [minSum, maxSum];
}

console.log("minMaxSum2 ", minMaxSum2([1, 2, 3, 4, 5]));
