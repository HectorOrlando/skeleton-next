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
