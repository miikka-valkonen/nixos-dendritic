{
  flake.modules.homeManager.tmux = {
    pkgs,
    config,
    ...
  }: {
    programs.tmux = {
      enable = true;
      plugins = with pkgs.tmuxPlugins; [
        minimal-tmux-status
        yank
        pain-control
        jump
      ];

      extraConfig = ''
        set -g default-command "env -u __ETC_PROFILE_NIX_SOURCED $SHELL"
        set-window-option -g mode-keys vi
        set -sg escape-time 10
        set -g focus-events on
        set -g default-terminal "screen-256color"
        set-option -a terminal-features 'xterm-256color:RGB'
        bind r source-file ~/.config/tmux/tmux.conf \; display-message "Config reloaded..."
        bind -T copy-mode-vi v send-keys -X begin-selection
        bind d kill-session
        bind -n M-h previous-window
        bind -n M-l next-window
        bind -n M-c copy-mode
        set -g @minimal-tmux-bg "#${config.lib.stylix.colors.base01}"
        set -g @minimal-tmux-fg "#${config.lib.stylix.colors.base06}"
        set -g @jump-bg-color '\e[0m\e[90m'
        set -g @jump-fg-color '\e[1m\e[31m'
        set -g @jump-keys 'tsraneiodhplfugjvmwybk'
        # Smart pane switching with awareness of Vim splits.
        # See: https://github.com/christoomey/vim-tmux-navigator
        vim_pattern='(\S+/)?g?\.?(view|l?n?vim?x?|fzf)(diff)?(-wrapped)?'
        is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
            | grep -iqE '^[^TXZ ]+ +''${vim_pattern}$'"
        bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
        bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
        bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
        bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
        tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
        if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
            "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
        if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
            "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"

        bind-key -T copy-mode-vi 'C-h' select-pane -L
        bind-key -T copy-mode-vi 'C-j' select-pane -D
        bind-key -T copy-mode-vi 'C-k' select-pane -U
        bind-key -T copy-mode-vi 'C-l' select-pane -R
        bind-key -T copy-mode-vi 'C-\' select-pane -l
      '';
    };
  };
}
