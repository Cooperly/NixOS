{ ... }:
{
  security.sudo = {
    enable = true;

    extraConfig = ''
      Defaults pwfeedback,passwd_tries=100,passwd_timeout=0
    '';
  };
}