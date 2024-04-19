import {PrismaClient} from '@prisma/client';

const prisma = new PrismaClient();

try {
  const users = await prisma.user.createMany({
    data: [
      {name: 'first user', createdAt: new Date()},
      {name: 'second user', createdAt: new Date()},
      {name: 'third user', createdAt: new Date()},
    ],
  });
  console.debug('succeed to insert seed data', users);
} catch (error) {
  console.error('failed to insert seed data', error);
}
