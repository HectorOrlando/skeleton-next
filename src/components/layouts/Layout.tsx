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
            <main style={{
                padding: '30px 20px 200px 20px'
            }}>
                {children}
            </main>

        </>
    )
}
