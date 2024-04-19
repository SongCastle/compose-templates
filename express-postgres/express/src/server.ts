import process from 'node:process';
import express from 'express';
import {PrismaClient} from '@prisma/client';

const app = express();
const host = process.env.EXPRESS_HOST ?? '';
const port = Number(process.env.EXPRESS_PORT ?? 3000);

const prisma = new PrismaClient();

app.get('/', (_, response) => {
  response.send('Hello World!');
});

app.get('/users', async (_, response) => {
  try {
    const users = await prisma.user.findMany();
    response.status(200).json({users});
  } catch (error) {
    console.error('failed to query `users`', error);
    response.status(400).json({error: `users_query_failed_error`});
  }
});

app.listen(port, host, () => {
  console.log(`Example app listening on port ${port}`);
});
