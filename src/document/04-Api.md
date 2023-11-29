### 1. Connectar a una Api (Gym)

Dentro del directorio `src/pages/api/gymApi.ts` con Axios hacemos la conexión con la api `axios.create` en el siguiente archivo hacemos un CRUD.

```ts
// src/pages/api/gymApi.ts

import axios from 'axios';
import { User } from '../../interfaces';

export const gymApi = axios.create({
    baseURL: 'https://gym-backend.upaje.com',
});

export const getUsers = async () => {
    const response = await gymApi.get('/gym/users');
    return response.data.users;
};

export const createUser = async (userData: User) => {
    const response = await gymApi.post('/gym/user', userData);
    return response.data;
};

export const updateUser = async (userId: string, userData: User) => {
    const response = await gymApi.put(`/gym/user/${userId}`, userData);
    return response.data;
};

export const deleteUser = async (userId: string) => {
    const response = await gymApi.delete(`/gym/user/${userId}`);
    return response.data;
};

```

### 2. enviar data al componente
a. dentro de la página donde se requiera data de la Api `src/pages/index.tsx`
crear un `getStaticProps` en este caso vamos a pasar todos los usuarios.

```ts
export const getStaticProps: GetStaticProps = async () => {
  const { data } = await gymApi.get<UsersListResponse>('/gym/users');
  return {
    props: {
      users: data.users
    }
  }
}
```
b. enviaremos los usuarios por props.`({ users })`
```ts
const Home: NextPage<UsersListResponse> = ({ users }) => {
  const [usersData, setUsersData] = useState(users);
}
```
c. luego le pasamos los usuarios que estarán en usersData al componente
```ts
<UsersTable users={usersData} />
```
d. Código de toda la página
```tsx
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

```