// src/pages/api/gymApi.ts

import axios from 'axios';
import { User } from '../../interfaces';

const gymApi = axios.create({
    baseURL: 'https://gym-backend.upaje.com/gym',
});

export const getUsers = async () => {
    const response = await gymApi.get('/users');
    return response.data.users;
};

export const createUser = async (userData: User) => {
    const response = await gymApi.post('/user', userData);
    return response.data;
};

export const updateUser = async (userId: string, userData: User) => {
    const response = await gymApi.put(`/user/${userId}`, userData);
    return response.data;
};

export const deleteUser = async (userId: string) => {
    const response = await gymApi.delete(`/user/${userId}`);
    return response.data;
};
