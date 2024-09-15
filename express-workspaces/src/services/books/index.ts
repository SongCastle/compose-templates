const books = [
  {
    id: 1,
    title: 'Apple',
    description: 'The story about Apple',
  },
  {
    id: 2,
    title: 'Banana',
    description: 'The story about Banana',
  },
  {
    id: 3,
    title: 'Orange',
    description: 'The story about Orange',
  },
];

const all = () => books;
const find = (id: number) => {
  return books.find(({id: bookID}) => bookID === id) ?? null;
};

export {all, find};
