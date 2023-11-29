// src/pages/index.tsx

import { useEffect, useState } from 'react';
import { Layout } from '../components/layouts/Layout';
import { getUsers } from './api';

const Home = () => {
  const [users, setUsers] = useState([]);

  const fetchUsers = async () => {
    try {
      const apiUsers = await getUsers();
      setUsers(apiUsers);
    } catch (error) {
      console.error('Error fetching users:', error);
    }
  };
  
  useEffect(() => {
    fetchUsers();
  }, []);

  return (
    <Layout title="Home">
      <h1>Welcome to the Gym!</h1>
      <ul>
        {users.map(({ _id, name, email }) => (
          <li key={_id}>{`id: ${_id}  name: ${name}  email: ${email}`}</li>
        ))}
      </ul>
    </Layout>
  );
};

export default Home;
