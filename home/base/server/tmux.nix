{ pkgs
, ...
}:
{

  programs.tmux = {
    enable = true;

    shortcut = "a";
    baseIndex = 1;
    escapeTime = 0;
    clock24 = true;
    terminal = "xterm-256color";

    keyMode = "vi";

    extraConfig = ''
      set -g renumber-windows on
      bind-key -T copy-mode-vi v send-keys -X begin-selection
    '';

    plugins = with pkgs.tmuxPlugins; [
      {
        # https://github.com/catppuccin/tmux
        # Soothing pastel theme for Tmux!
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_window_right_separator "█ "
          set -g @catppuccin_window_number_position "right"
          set -g @catppuccin_window_middle_separator " | "
        
          set -g @catppuccin_window_default_fill "none"
        
          set -g @catppuccin_window_current_fill "all"
        
          set -g @catppuccin_status_modules "application session user host date_time"
          set -g @catppuccin_status_left_separator "█"
          set -g @catppuccin_status_right_separator "█"
        
          set -g @catppuccin_date_time_text "%Y-%m-%d %H:%M:%S"
          set -g @catppuccin_status_modules "... battery ..."
        '';
      }
      {
        # https://github.com/tmux-plugins/tmux-battery
        # Plug and play battery percentage and icon indicator for Tmux.
        plugin = battery;
      }
      {
        # https://github.com/tmux-plugins/tmux-yank
        # Tmux plugin for copying to system clipboard.
        plugin = yank;
      }
      {
        # https://github.com/tmux-plugins/tmux-resurrect
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-capture-pane-contents 'on' 
          set -g @resurrect-processes ':all:'
        '';
      }
      {
        # https://github.com/tmux-plugins/tmux-continuum
        # Continuous saving of tmux environment. Automatic restore when tmux is started. Automatic tmux start when computer is turned on.
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-save-interval '120'
          set -g @continuum-restore 'on'
          set -g status-right 'Continuum status: #{continuum_status}'
        '';
      }
      {
        # https://github.com/tmux-plugins/tmux-pain-control
        # standard pane key-bindings for tmux
        plugin = pain-control;
      }
    ];
  };
}
