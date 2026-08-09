{ ... }: 
{
  # systemd will consume all disk IO for minutes at a time when applications crash, please stop!
  systemd.coredump = {
    enable = false;
    settings.Coredump = { Storage = "none"; };
  };
}