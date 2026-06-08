{ ... }:
{
  services.openssh = {
    enable = true;
    ports = [22];
    authorizedKeysInHomedir = true;

    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "yes";
      PubkeyAuthentication = "yes";
    };
  };
}