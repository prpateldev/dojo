// 07:05:45PM
function convert(time) {
  const hourStr = time.slice(0, 2);
  const ampm = time.slice(time.length - 2);
  const minAndSecStr = time.slice(3, 8);
  console.log({ hourStr, ampm, time, minAndSecStr });

  let hour = parseInt(hourStr);
  if (ampm === "AM") {
    if (hour === 12) {
      hour = "00";
    } else if (hour < 10) {
      hour = "0" + hour;
    }
  } else {
    hour = hour < 12 ? hour + 12 : hour;
  }

  return hour + ":" + minAndSecStr;
}

// console.log('input 11:05:45PM should return 19:05:45', convert('11:05:45AM'))
// console.log('input 01:05:45PM should return 19:05:45', convert('01:05:45AM'))
console.log("input 9:05:45AM should return 19:05:45", convert("09:05:45AM"));
console.log("input 12:05:45PM should return 19:05:45", convert("12:05:45PM"));
