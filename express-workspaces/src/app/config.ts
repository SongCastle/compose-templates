import {env} from 'node:process';

export const config = {
  server: {
    host: env.EXPRESS_SERVER_HOST ?? '',
    port: Number(env.EXPRESS_SERVER_PORT) || 3000,
  },
};
