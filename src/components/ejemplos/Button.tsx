// src\components\ejemplos\Button.tsx

import React, { ReactNode } from 'react';
import { Button as MuiButton, ButtonProps } from '@mui/material';

interface CustomButtonProps extends ButtonProps {
  children: ReactNode;
}

export const Button: React.FC<CustomButtonProps> = ({ children, ...props }) => {
  return <MuiButton variant="contained" {...props}>{children}</MuiButton>;
}
