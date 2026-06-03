{ ... }:
{
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    opts = {
      shiftwidth = 2;
      expandtab = true;
      colorcolumn = [ 80 100 ];
    };

    plugins = {
      nix.enable = true;
    };
  };

  environment.variables =  {
    EDITOR = "nvim";
  };
}