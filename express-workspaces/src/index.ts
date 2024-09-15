import express, {type Request} from 'express';
import {all as allUsers, find as findUser} from '@express-workspaces/users';
import {all as allBooks, find as findBook} from '@express-workspaces/books';
import {config} from './app/config.js';

const app = express();
const {host, port} = config.server;

/*
 * Top
 */
app.get('/', (_, response) => {
  response.json({message: 'weclome !!'});
});

/*
 * Users
 */
app.get('/users', (_, response) => {
  response.json({users: allUsers()});
});
app.get('/users/:id', (request: Request<{id: string}>, response) => {
  const id = request.params.id;

  if (!Number(id)) {
    return response.status(400).json({message: "invalid user's id", value: id});
  }

  const user = findUser(Number(id));

  if (user) {
    return response.json({user});
  }

  return response.status(404).json({message: 'user not_found', value: id});
});

/*
 * Books
 */
app.get('/books', (_, response) => {
  response.json({books: allBooks()});
});
app.get('/books/:id', (request: Request<{id: string}>, response) => {
  const id = request.params.id;

  if (!Number(id)) {
    return response.status(400).json({message: "invalid book's id", value: id});
  }

  const book = findBook(Number(id));

  if (book) {
    return response.json({book});
  }

  return response.status(404).json({message: 'book not_found', value: id});
});

/*
 * Default
 */
app.all('*', (request, response) => {
  response.status(400).json({message: 'unknown path', path: request.path});
});

app.listen(port, host, () => {
  console.log(`Express Started: host: ${host}, port ${port}`);
});
