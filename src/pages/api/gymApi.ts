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
