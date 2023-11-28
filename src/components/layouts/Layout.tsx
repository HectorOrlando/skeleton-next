// src\components\layouts\Layout.tsx

import Head from 'next/head'
import React, { FC, PropsWithChildren } from 'react'

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
            {/* Navbar */}
            <main>
                {children}
            </main>

        </>
    )
}