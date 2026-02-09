"use client";

import { ReactNode } from "react";
import { MsalProvider } from "@azure/msal-react";
import { msalInstance, isAuthEnabled } from "@/lib/auth";

export function AuthProvider({ children }: { children: ReactNode }) {
  if (!isAuthEnabled || !msalInstance) {
    return <>{children}</>;
  }
  return <MsalProvider instance={msalInstance}>{children}</MsalProvider>;
}
