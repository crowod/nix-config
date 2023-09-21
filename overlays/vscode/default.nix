self: super: 
let
  myfhs = { additionalPkgs ? super: [] }: super.buildFHSEnv (super.vscode.fhs.args // 
  {
    profile = ''
      export XDG_SESSION_TYPE=x11
    '';
  });
in
{
  vscode.fhs = myfhs {};
}
