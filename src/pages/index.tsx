// src/pages/index.tsx

import { useEffect, useState } from 'react';
import { GetStaticProps, NextPage } from 'next'
import { UsersListResponse } from '@/interfaces';
import { getUsers, gymApi } from './api';
import { Layout } from '../components/layouts/Layout';
import { UsersTable } from '@/components/users';


const Home: NextPage<UsersListResponse> = ({ users }) => {
  const [usersData, setUsersData] = useState(users);

  const fetchUsers = async () => {
    try {
      const apiUsers = await getUsers();
      setUsersData(apiUsers);
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
      {/* Usa el componente de la tabla aquí */}
      <UsersTable users={usersData} />
    </Layout>
  );
};

export const getStaticProps: GetStaticProps = async () => {
  const { data } = await gymApi.get<UsersListResponse>('/gym/users');
  return {
    props: {
      users: data.users
    }
  }
}

export default Home;
