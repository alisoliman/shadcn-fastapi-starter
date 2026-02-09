import { PublicClientApplication } from "@azure/msal-browser";

declare global {
  interface Window {
    __env?: Record<string, string>;
  }
}

const runtime = typeof window !== "undefined" ? window.__env ?? {} : {};

const clientId = runtime.NEXT_PUBLIC_AZURE_CLIENT_ID || "";

export const isAuthEnabled = clientId.length > 0;

const msalConfig = {
  auth: {
    clientId,
    authority: `https://login.microsoftonline.com/${runtime.NEXT_PUBLIC_AZURE_TENANT_ID || ""}`,
    redirectUri:
      runtime.NEXT_PUBLIC_AZURE_REDIRECT_URI ||
      (typeof window !== "undefined" ? window.location.origin : ""),
  },
  cache: {
    cacheLocation: "sessionStorage" as const,
    storeAuthStateInCookie: false,
  },
};

export const msalInstance = isAuthEnabled
  ? new PublicClientApplication(msalConfig)
  : null;
