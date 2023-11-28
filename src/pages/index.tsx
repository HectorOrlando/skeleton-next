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
