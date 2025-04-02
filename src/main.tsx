
import React from 'react';
import { createRoot } from 'react-dom/client';
import App from './App.tsx';
import './index.css';
import { CartProvider } from './hooks/use-cart';
import { Toaster } from "@/components/ui/toaster";

const container = document.getElementById('root');
if (!container) throw new Error('Failed to find the root element');
const root = createRoot(container);

root.render(
  <React.StrictMode>
    <CartProvider>
      <App />
      <Toaster />
    </CartProvider>
  </React.StrictMode>
);
