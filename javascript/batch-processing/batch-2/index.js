const ordersData = [
  { orderId: 1, product: 'Phone', quantity: 2, price: 15 },
  { orderId: 2, product: 'Tablet', quantity: 1, price: 25 },
  { orderId: 3, product: 'Macbook', quantity: 3, price: 30 },
  { orderId: 4, product: 'Laptop', quantity: 1, price: 20 },
  { orderId: 5, product: 'Microphone', quantity: 4, price: 18 },
  { orderId: 6, product: 'Earphones', quantity: 2, price: 35 },
  { orderId: 7, product: 'Jacket', quantity: 1, price: 22 },
  { orderId: 8, product: 'Shirt', quantity: 2, price: 28 },
  { orderId: 9, product: 'Shorts', quantity: 3, price: 12 },
  { orderId: 10, product: 'Pants', quantity: 2, price: 40 },
  { orderId: 11, product: 'Gazebo', quantity: 1, price: 25 },
  { orderId: 12, product: 'Dressing Table', quantity: 3, price: 20 },
  { orderId: 13, product: 'Charger', quantity: 1, price: 32 },
  { orderId: 14, product: 'Television', quantity: 2, price: 14 },
  { orderId: 15, product: 'Sweater', quantity: 4, price: 26 },
];

function wait(delay, payload, isReject = false) {
  return new Promise((resolve, reject) => setTimeout(() => {
    isReject ? reject(payload) : resolve(payload)
  }, delay))
}

function logEndTime(startTime) {
  const endTime = performance.now();
  const executionTime = endTime - startTime;

  console.log(`Execution time: ${executionTime} milliseconds`);
}

async function updateOrderPrice(order) {
  const newPrice = parseFloat((order.price * 1.1).toFixed(1));
  return wait(2000, { ...order, price: newPrice });
}

async function processAJob(job, processingFunction) {
  try {
    const updatedOrder = await processingFunction(job);
    console.log(`Order ${updatedOrder.orderId} - Updated Price: $${updatedOrder.price}`);
    return {
      result: 'success',
      data: updatedOrder
    }
  } catch (error) {
    return {
      result: 'error',
      error: error,
      data: updatedOrder
    }
  }
}

async function processABatchSynchronous(batch, processingFunction) {
  const batchProcessingResults = []
  for (const job of batch) {
    const processResult = await (processingFunction(job, updateOrderPrice))
    batchProcessingResults.push(processResult);
  }

  return batchProcessingResults
}

async function processABatchAsynchronous(batch, processingFunction) {
  const allPromises = []
  for (const job of batch) {
    allPromises.push(processingFunction(job, updateOrderPrice))
  }

  return await Promise.allSettled(allPromises)
}


async function run(batchJobs, batchSize, processingFunction) {
  console.log("Processing %s jobs", batchJobs.length)
  const numOfBatches = Math.ceil(batchJobs.length / batchSize);
  const startTime = performance.now();

  for (let batchIndex = 0; batchIndex < numOfBatches; batchIndex++) {
    const start = batchIndex * batchSize;
    const end = Math.min(start + batchSize, batchJobs.length);
  
    const batch = batchJobs.slice(start, end);
  
    // const batchProcessingResults = await processABatchSynchronous(batch, processingFunction); // Execution time: 30036.236542 milliseconds
    const batchProcessingResults = await processABatchAsynchronous(batch, processingFunction); // Execution time: 6014.568958 milliseconds
    // console.log(`Batch ${batchIndex + 1} processed.`);
    // console.log(batchProcessingResults)
    // console.log("");
  }

  logEndTime(startTime)
}

run(ordersData, 5, processAJob)

console.log('Batch processing of order prices is complete.');
