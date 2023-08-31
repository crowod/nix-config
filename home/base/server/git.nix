{ username
, email
, ...
}: {
  programs.git = {
    enable = true;
    userName = username;
    userEmail = email;
    ignores = [
      ".idea"
      ".vscode"
    ];
  };
}
