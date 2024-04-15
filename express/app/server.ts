import express from 'express'

const app = express()
const host = process.env.EXPRESS_HOST || '';
const port = Number(process.env.EXPRESS_PORT || 3000);

app.get('/', (_, res) => {
  res.send('Hello World!')
})

app.listen(port, host, () => {
  console.log(`Example app listening on port ${port}`)
})
