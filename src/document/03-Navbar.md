`Navbar` es un componente de barra de navegación implementado con Material-UI y diseñado para funcionar de manera receptiva tanto en dispositivos de escritorio como en dispositivos móviles. Aquí tienes una descripción breve:

- **Funcionalidad Principal:**
  - Muestra una barra de navegación con un logotipo (`CottageIcon`) y opciones de menú.
  - Adapta su diseño según el tamaño de la pantalla para proporcionar una experiencia de usuario óptima tanto en dispositivos de escritorio como en dispositivos móviles.

- **Elementos Principales:**
  - Utiliza `AppBar`, `Toolbar`, y otros componentes de Material-UI para construir la estructura de la barra de navegación.
  - Contiene iconos (`CottageIcon`, `AccountCircleIcon`) y texto para representar el logotipo y las opciones de menú.
  - Muestra opciones de menú, que incluyen enlaces a diferentes páginas y configuraciones de usuario.

- **Interactividad:**
  - Permite al usuario abrir menús desplegables al hacer clic en ciertos elementos.
  - Utiliza el enrutador de Next.js (`useRouter`) para manejar las transiciones entre páginas al hacer clic en los enlaces.

- **Personalización:**
  - Proporciona comentarios (`TODO`) indicando áreas específicas del código que deben modificarse, como cambiar el texto del logotipo y el logotipo mismo (`CottageIcon`), y realizar ajustes en las versiones móviles y de escritorio.

- **Estilo Responsivo:**
  - Adapta la disposición de los elementos según el tamaño de la pantalla para garantizar una presentación coherente y amigable para el usuario.

En resumen, este componente es una barra de navegación flexible y personalizable que se integra con la biblioteca Material-UI y está preparada para su uso en proyectos Next.js con TypeScript.

```tsx
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

```