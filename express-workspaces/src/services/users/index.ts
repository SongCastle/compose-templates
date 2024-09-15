const users = [
  {
    id: 1,
    name: 'ichiro',
  },
  {
    id: 2,
    name: 'jiro',
  },
  {
    id: 3,
    name: 'saburo',
  },
];

const all = () => users;
const find = (id: number) => {
  return users.find(({id: userID}) => userID === id) ?? null;
};

export {all, find};
