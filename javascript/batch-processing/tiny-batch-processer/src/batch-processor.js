function* getNextJobGenerator(jobs) {
  if(jobs && jobs.length) {
    const len = jobs.length
    let i = 0
    while(i < len) {
      yield jobs[i]
      i++
    }
  }

  return { value: undefined, done: true }

}

async function jobExecutor(getNextJob, processingFn, processIndex, log) {
  while(true) {
    const job = getNextJob.next()
    if(job.done) break
    log('worker = %s, processing', processIndex)
    await processingFn(job.value)
    log('worker = %s, processing done', processIndex)
  }
}


export async function spawnJobs(config) {
  const {
    data,
    numberOfProcess,
    processingFn,
    log
  } = config

  log('spawnJobs get called.')

  if(!data) {
    log('No data to spawn jobs.')
    return
  }

  const getNextJob = getNextJobGenerator(data)
  for(let processIndex = 0; processIndex < numberOfProcess; processIndex++) {
    log('spawning worker = %s ', processIndex)
    jobExecutor(getNextJob, processingFn, processIndex, log)
  }

}
