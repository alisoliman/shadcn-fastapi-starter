"use client";

import { useMsal } from "@azure/msal-react";
import { Button } from "@/components/ui/button";
import { isAuthEnabled } from "@/lib/auth";

export function LoginButton() {
  if (!isAuthEnabled) {
    return null;
  }

  return <LoginButtonInner />;
}

function LoginButtonInner() {
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
