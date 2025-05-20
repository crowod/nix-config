{ pkgs, ... }:

{
  security.pam.services.sudo_local.touchIdAuth = true;
 
  # # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
  # activationScripts.postUserActivation.text = ''
  #   # activateSettings -u will reload the settings from the database and apply them to the current session,
  #   # so we do not need to logout and login again to make the changes take effect.
  #   /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  # '';
  
  system = {
    primaryUser = "crowod";
    defaults = {
      menuExtraClock.Show24Hour = true;  # show 24 hour clock

      # other macOS's defaults configuration.

      CustomUserPreferences = {
        "com.apple.screensaver" = {
          # Require password immediately after sleep or screen saver begins
          askForPassword = 1;
          askForPasswordDelay = 5;
          loginWindowIdleTime = 1200;
        };
      };
    };
  };

  fonts = {
    packages = with pkgs; [
      material-design-icons
      font-awesome

      source-sans 
      source-serif 
      source-han-sans 
      source-han-serif 

      # nerdfonts
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.iosevka
    ];
  };
}