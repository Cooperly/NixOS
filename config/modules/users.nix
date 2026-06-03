{ ... }:
{
  users = {
    mutableUsers = true;
    
    users.void = {
      isNormalUser = true;
      hashedPassword = "$y$j9T$ExOvWXvHAwABHNotvgsTL.$4gZc4UlqjBJnJ8I/NO8TyOfrPdSPocEtSyxNGjQUti2";
      
      extraGroups = [
        "wheel"
        "audio"
        "networkmanager"
      ];
    };
  };
}