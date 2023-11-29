// src/pages/index.tsx

import { useEffect, useState } from 'react';
import { GetStaticProps, NextPage } from 'next'
import { User, UsersListResponse } from '@/interfaces';
import { getUsers, gymApi } from './api';
import { Layout } from '../components/layouts/Layout';

interface Props {
  usersData: User[]
}

const Home: NextPage<Props> = ({ usersData }) => {
  const [users, setUsers] = useState(usersData);
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

export const getStaticProps: GetStaticProps = async () => {
  const { data } = await gymApi.get<UsersListResponse>('/gym/users');
  return {
    props: {
      usersData: data.users
    }
  }
}

export default Home;
