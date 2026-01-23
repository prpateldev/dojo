import { spawnJobs } from '../src/batch-processor.js'
import mockData from './mock-data.js'

function wait(delay, payload, isReject = false) {
  return new Promise((resolve, reject) => setTimeout(() => {
    isReject ? reject(payload) : resolve(payload)
  }, delay))
}

async function updateOrderPrice(order) {
  const newPrice = parseFloat((order.price * 1.1).toFixed(1)); 
  const delay = (Math.floor(Math.random() * 5) + 1) * 1000;
  const updatedOrder = await wait(delay, { ...order, price: newPrice });
  console.log(updatedOrder)
  return updatedOrder
}

function main() {
  spawnJobs({
    data: mockData,
    numberOfProcess: 2,
    processingFn: updateOrderPrice,
    log: console.log
  })
}

main()
