function adjacentElementProductLong(inputArray) {
  const len = inputArray.length;
  let maxProduct = 0;
  for (let i = 0; i < len; i++) {
    const nextIndex = i + 1;
    if (nextIndex === len) {
      break;
    }

    let product = inputArray[i] * inputArray[nextIndex];
    if (product > maxProduct) {
      maxProduct = product;
    }
  }

  return maxProduct;
}

function adjacentElementProduct(inputArray) {
  let maxProduct = 0;
  for (let i = 0; i < inputArray.length; i++) {
    const nextIndex = i + 1;
    if (nextIndex < inputArray.length) {
      let product = inputArray[i] * inputArray[nextIndex];
      if (maxProduct === 0 || product > maxProduct) {
        maxProduct = product;
      }
    }
  }

  return maxProduct;
}

function check(arr) {
  let maxProduct = 0;
  let p0 = -1;
  for (let p1 = 0; p1 < arr.length; p1++) {
    let p2 = p1 + 1;
    if (p2 >= arr.length) {
      break;
    }

    if (p0 > -1 && arr[p2] < arr[p0]) {
      // no need to mulitple and check maxProduct
      // skip this intertation
      p0 = p1;
      continue;
    }

    p0 = p1;

    const product = arr[p1] * arr[p2];
      if(maxProduct === null || maxProduct < product) {
          maxProduct = product
      }
  }

  return maxProduct;
}

    // let product = 0
    
    // for(let p1=0; p1<inputArray.length; p1++) {
    //     let p2 = p1+1
    //     if(p2 < inputArray.length) {    
    //         let thisProduct = inputArray[p1] * inputArray[p2]
    //         if(product === 0 || product < thisProduct) {
    //             product = thisProduct
    //         }
    //     }
    // }
    
    // return product

console.log(
  "adjacentElementProduct = ",
  adjacentElementProduct([3, 6, -2, -5, 7, 3])
);
console.log("adjacentElementProduct = ", check([3, 6, -2, -5, 7, 3]));
console.log("adjacentElementProduct = ", check([5, 1, 2, 3, 1, 4]));

