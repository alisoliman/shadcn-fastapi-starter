"use client";

import { ReactNode } from "react";
import { MsalProvider } from "@azure/msal-react";
import { msalInstance } from "@/lib/auth";

export function AuthProvider({ children }: { children: ReactNode }) {
  return <MsalProvider instance={msalInstance}>{children}</MsalProvider>;
}
