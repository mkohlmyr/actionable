exports.handler = async function (event, context) {
  event.Records.forEach(record => {
    console.log(record.body)
  });
  return true;
}