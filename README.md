# Skeleton-Next


Pasos para arrancar un proyecto clonado desde GitHub:

1. **Clonar el repositorio:**

   ```bash
   git@github.com:HectorOrlando/skeleton-next.git
   ```

   

2. **Navegar al directorio del proyecto:**

   ```bash
   cd skeleton-next
   ```

3. **Instalar dependencias:**

   ```bash
   npm install
   ```

   Esto instalará todas las dependencias necesarias que están definidas en el archivo `package.json`.


4. **Compilar el código TypeScript:**

   ```bash
   npm run build
   ```

   Esto compilará el código TypeScript y generará los archivos JavaScript en el directorio `dist/`.

5. **Iniciar la aplicación:**

   ```bash
   npm start
   ```

   Esto arrancará la aplicación con Node.js, utilizando los archivos JavaScript generados en el paso anterior.

   O, si prefieres utilizar nodemon en modo de desarrollo:

   ```bash
   npm run dev
   ```

   Esto arrancará la aplicación con nodemon, lo que reiniciará automáticamente la aplicación cuando detecte cambios en los archivos.

6. **Acceder a la aplicación:**

   Abre tu navegador y accede a la aplicación a través de la URL y el puerto configurados en tu archivo `.env` o en el código del servidor.

7. **Probar la aplicación:**

   Realiza pruebas en las rutas y funcionalidades de tu aplicación para asegurarte de que todo funcione como se espera.

Estos pasos deberían proporcionarte una guía básica para arrancar un proyecto clonado. Asegúrate de revisar el archivo `package.json` del proyecto clonado para conocer cualquier configuración específica de scripts o dependencias. Además, ten en cuenta que estos pasos pueden variar ligeramente dependiendo de la configuración específica del proyecto.



---

## Configuración

### Tema

Puedes configurar el tema de la aplicación en el archivo `src\themes\theme-light.ts`. Si prefieres un tema oscuro, puedes modificar el archivo `src\themes\theme-dark.ts`.

### Layout

La configuración del layout se encuentra en el archivo `src\components\layouts\Layout.tsx`. Si necesitas ajustar la estructura de la página, este es el lugar para hacerlo.

### Barra de Navegación

La barra de navegación puede ser personalizada en el archivo `src\components\ui\Navbar.tsx`. Aquí puedes agregar, eliminar o modificar las secciones de navegación según tus necesidades.

```bash
src
|-- themes
|   |-- theme-dark.ts
|   |-- theme-light.ts
|-- components
|   |-- layouts
|   |   |-- Layout.tsx
|   |-- ui
|       |-- Navbar.tsx
```

Recuerda que después de realizar cambios en la configuración, puedes reiniciar la aplicación con `npm start`.

¡Espero que disfrutes trabajando con Skeleton-Frontend! 😊
```

Este README proporciona información clara sobre cómo instalar el proyecto y dónde realizar configuraciones clave. Asegúrate de actualizar los enlaces y la información según sea necesario para que coincida con la estructura real de tu proyecto.