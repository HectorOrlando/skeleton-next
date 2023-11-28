// src\pages\_app.tsx

import '@/styles/globals.css'
import type { AppProps } from 'next/app'
import { ThemeProvider } from '@mui/material/styles'
import { CssBaseline } from '@mui/material'
import { themeDark, themeLight } from '../themes'

export default function App({ Component, pageProps }: AppProps) {
  return (
    <ThemeProvider theme={themeLight}>
      <CssBaseline />
      <Component {...pageProps} />
    </ThemeProvider>
  )
}

// src\pages\_document.tsx

import { Html, Head, Main, NextScript } from 'next/document'

export default function Document() {
  return (
    <Html lang="es">
      <Head />
      <body>
        <Main />
        <NextScript />
      </body>
    </Html>
  )
}

// src\pages\index.tsx

import { Button } from "@/components/ejemplos";
import { Layout } from "@/components/layouts";

export default function Home() {
  return (
    <Layout
      title="Nombre de la Página.(Modificar)"
    >
      <h1>Hola Orlando.</h1>
      <Button>Button de ejemplo, themes</Button>
    </Layout>
  )
}

// src\themes\theme-dark.ts

import { createTheme } from '@mui/material/styles';

export const themeDark = createTheme({
    palette: {
        mode: 'dark',
        primary: {
            main: '#3f51b5',
        },
        secondary: {
            main: '#f50057',
        },
    },
});

// src\themes\theme-light.ts

import { createTheme } from '@mui/material/styles';

export const themeLight = createTheme({
    palette: {
        mode: 'light',
        primary: {
            main: '#3f51b5',
        },
        secondary: {
            main: '#f50057',
        },
    },
});

// src\components\ejemplos\Button.tsx

import React, { ReactNode } from 'react';
import { Button as MuiButton, ButtonProps } from '@mui/material';

interface CustomButtonProps extends ButtonProps {
  children: ReactNode;
}

export const Button: React.FC<CustomButtonProps> = ({ children, ...props }) => {
  return <MuiButton variant="contained" {...props}>{children}</MuiButton>;
}

// src\components\layouts\Layout.tsx

import Head from 'next/head'
import React, { FC, PropsWithChildren } from 'react'
import Navbar from '../ui/Navbar';

interface Props {
    title?: string;
}

export const Layout: FC<PropsWithChildren<Props>> = ({ children, title }) => {
    return (
        <>
            <Head>
                <title>{title || 'Skeleton-Next'}</title>
                <meta name='author' content='Hector Orlando' />
                <meta name='description' content={`Informanción sobre la página ${title}`} />
                <meta name='keywords' content={`${title}, Next.js, TypeScript, Node.js`} />
            </Head>
            <Navbar />
            <main>
                {children}
            </main>

        </>
    )
}

// src\components\ui\Navbar.tsx

import * as React from 'react';
import { useRouter } from 'next/router';

import AppBar from '@mui/material/AppBar';
import Box from '@mui/material/Box';
import Toolbar from '@mui/material/Toolbar';
import IconButton from '@mui/material/IconButton';
import Typography from '@mui/material/Typography';
import Menu from '@mui/material/Menu';
import MenuIcon from '@mui/icons-material/Menu';
import Container from '@mui/material/Container';
import Tooltip from '@mui/material/Tooltip';
import MenuItem from '@mui/material/MenuItem';
import AccountCircleIcon from '@mui/icons-material/AccountCircle';
import CottageIcon from '@mui/icons-material/Cottage';

/*
    TODO: Hacer cambios en versión Mobile y PC. 
    TODO: Cambiar texto de `Logo`, el Logo `CottageIcon`, y el array de const pages = ['Page-1', 'Page-2', 'Page-3', 'Upaje'];
*/

const pages = ['Page-1', 'Page-2', 'Page-3', 'Upaje'];
const settings = ['Profile', 'Account', 'Dashboard', 'Logout'];

const Navbar = () => {
    const router = useRouter();

    const [anchorElNav, setAnchorElNav] = React.useState<null | HTMLElement>(null);
    const [anchorElUser, setAnchorElUser] = React.useState<null | HTMLElement>(null);

    const handleOpenNavMenu = (event: React.MouseEvent<HTMLElement>) => {
        setAnchorElNav(event.currentTarget);
    };
    const handleOpenUserMenu = (event: React.MouseEvent<HTMLElement>) => {
        setAnchorElUser(event.currentTarget);
    };

    const handleCloseNavMenu = () => {
        setAnchorElNav(null);
    };

    const handleCloseUserMenu = () => {
        setAnchorElUser(null);
    };

    return (
        <AppBar position="static">
            <Container maxWidth="xl">
                <Toolbar disableGutters>

                    {/* Versión PC y Table  */}
                    <CottageIcon sx={{ display: { xs: 'none', md: 'flex' }, mr: 1 }} />

                    <Typography
                        variant="h6"
                        noWrap
                        component="a"
                        href="/"
                        sx={{
                            mr: 2,
                            display: { xs: 'none', md: 'flex' },
                            fontFamily: 'monospace',
                            fontWeight: 700,
                            letterSpacing: '.3rem',
                            color: 'inherit',
                            textDecoration: 'none',
                        }}
                    >
                        Logo
                    </Typography>

                    <Box sx={{ flexGrow: 1, display: { xs: 'flex', md: 'none' } }}>
                        <IconButton
                            size="large"
                            aria-label="account of current user"
                            aria-controls="menu-appbar"
                            aria-haspopup="true"
                            onClick={handleOpenNavMenu}
                            color="inherit"
                        >
                            <MenuIcon />
                        </IconButton>
                        <Menu
                            id="menu-appbar"
                            anchorEl={anchorElNav}
                            anchorOrigin={{
                                vertical: 'bottom',
                                horizontal: 'left',
                            }}
                            keepMounted
                            transformOrigin={{
                                vertical: 'top',
                                horizontal: 'left',
                            }}
                            open={Boolean(anchorElNav)}
                            onClose={handleCloseNavMenu}
                            sx={{
                                display: { xs: 'block', md: 'none' },
                            }}
                        >
                            {pages.map((page) => (
                                <a key={page} href={(page !== 'Upaje') ? `/${page.toLowerCase()}` : `https://upaje.com/`} style={{ textDecoration: 'none', color: 'inherit' }}>
                                    <Typography
                                        textAlign="center"
                                        onClick={() => router.push(`/${page.toLowerCase()}`)}
                                        sx={{
                                            margin: 0,
                                            padding: '12px',
                                            color: 'black',
                                            cursor: 'pointer',
                                            '&:hover': {
                                                textDecoration: 'underline',
                                            },
                                        }}
                                    >
                                        {page}
                                    </Typography>
                                </a>
                            ))}
                        </Menu>

                    </Box>

                    {/* Versión Mobile  */}
                    <CottageIcon sx={{ display: { xs: 'flex', md: 'none' }, mr: 1 }} />

                    <Typography
                        variant="h5"
                        noWrap
                        component="a"
                        href="/"
                        sx={{
                            mr: 2,
                            display: { xs: 'flex', md: 'none' },
                            flexGrow: 1,
                            fontFamily: 'monospace',
                            fontWeight: 700,
                            letterSpacing: '.3rem',
                            color: 'inherit',
                            textDecoration: 'none',
                        }}
                    >
                        Logo
                    </Typography>

                    <Box sx={{ flexGrow: 1, display: { xs: 'none', md: 'flex' } }}>
                        {pages.map((page) => (
                            <a key={page} href={(page !== 'Upaje') ? `/${page.toLowerCase()}` : `https://upaje.com/`} style={{ textDecoration: 'none', color: 'inherit', marginRight: '16px' }}>
                                <Typography textAlign="center" onClick={() => router.push(`/${page.toLowerCase()}`)}>
                                    {page}
                                </Typography>
                            </a>
                        ))}
                    </Box>

                    <Box sx={{ flexGrow: 0 }}>
                        <Tooltip title="Open settings">
                            <IconButton onClick={handleOpenUserMenu} sx={{ p: 0 }}>
                                <AccountCircleIcon sx={{ color: 'white', fontSize: 50 }} />
                            </IconButton>
                        </Tooltip>
                        <Menu
                            sx={{ mt: '45px' }}
                            id="menu-appbar"
                            anchorEl={anchorElUser}
                            anchorOrigin={{
                                vertical: 'top',
                                horizontal: 'right',
                            }}
                            keepMounted
                            transformOrigin={{
                                vertical: 'top',
                                horizontal: 'right',
                            }}
                            open={Boolean(anchorElUser)}
                            onClose={handleCloseUserMenu}
                        >
                            {settings.map((setting) => (
                                <MenuItem key={setting} onClick={handleCloseUserMenu}>
                                    <Typography textAlign="center">{setting}</Typography>
                                </MenuItem>
                            ))}
                        </Menu>
                    </Box>
                </Toolbar>
            </Container>
        </AppBar>
    );
}

export default Navbar;





