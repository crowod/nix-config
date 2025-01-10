{ pkgs, pkgs-unstable, ... }: {

  environment.systemPackages = with pkgs; [
    pkgs-unstable.neovim
    git
    gnutar
    gnugrep
    gnused
  ];
  
  environment.variables.EDITOR = "nvim";
  environment.shellAliases = {
    vim = "nvim";
    vi = "nvim";
  };

  programs = {
    fish = {
      enable = true;
      shellInit = ''
        eval "$(/opt/homebrew/bin/brew shellenv)"
        
        if test -f ~/.fishenv 
          source $HOME/.fishenv
        end
      '';
    };
    zsh = {
      enable = true;
    };
  };

  environment.shells = with pkgs; [
    bash
    fish
  ];
  environment.variables = {
    HOMEBREW_API_DOMAIN = "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api";
    HOMEBREW_BOTTLE_DOMAIN = "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles";
    HOMEBREW_BREW_GIT_REMOTE = "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git";
    HOMEBREW_CORE_GIT_REMOTE = "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git";
    HOMEBREW_PIP_INDEX_URL = "https://pypi.tuna.tsinghua.edu.cn/simple";
  };
  
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      # 'zap': uninstalls all formulae(and related files) not listed in the generated Brewfile
      cleanup = "zap";
      extraFlags = [
        "--force"
      ];
    };

    taps = [
      "homebrew/cask"
      "homebrew/cask-fonts"
      "homebrew/services"
      "homebrew/cask-versions"
      "jstkdng/programs"
    ];

    # brew install
    brews = [
      "wget"
      "curl" 
      "aria2" 
      "jq"
      "fd"
      "btop"
      "ncdu"
      "ranger"
      "ripgrep"
      "tmux"
      "zip"
      "unzip"
      "tree"
      "glow"
      "go"
      "parallel"
      "bat"
      "btop"
      "htop"
      "jstkdng/programs/ueberzugpp"
      "npm"
      "fx"
      "prettier"
      "tokei"
    ];

    # brew install --cask
    casks = [
      "alt-tab"
      "maccy"
      "snipaste"
      "google-chrome"
      "visual-studio-code"
      "postman"
      "goland"
      "feishu"
      "obsidian"
      "dropbox"
      "zotero"
      "wechat"
      "qq"
      "karabiner-elements"
      "kitty"
      "hammerspoon"
      "popclip"
      "picgo"
      "datagrip"
      "chromium"
      "raycast"
      "docker"
    ];
    masApps = {
      Longshot = 6450262949;
    };
  };
}