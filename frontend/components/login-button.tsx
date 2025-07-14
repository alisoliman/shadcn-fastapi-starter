"use client";

import { useMsal } from "@azure/msal-react";
import { Button } from "@/components/ui/button";

export function LoginButton() {
  const { instance, accounts } = useMsal();

  const handleLogin = () => instance.loginRedirect();
  const handleLogout = () => instance.logoutRedirect();

  if (accounts.length > 0) {
    return (
      <Button variant="ghost" size="sm" onClick={handleLogout}>
        Sign out
      </Button>
    );
  }

  return (
    <Button variant="ghost" size="sm" onClick={handleLogin}>
      Sign in
    </Button>
  );
}
