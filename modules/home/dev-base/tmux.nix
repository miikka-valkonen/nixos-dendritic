{
  flake.modules.homeManager.tmux = {pkgs, ...}: {
    programs.tmux = {
      enable = true;
      plugins = with pkgs.tmuxPlugins; [
        minimal-tmux-status
        yank
        copy-toolkit
      ];

      extraConfig = ''
        set -g default-command "env -u __ETC_PROFILE_NIX_SOURCED $SHELL"
        set-window-option -g mode-keys vi
        set -sg escape-time 10
        set -g focus-events on
        set -g default-terminal "screen-256color"
        bind-key -T copy-mode-vi v send-keys -X begin-selection
        bind-key -T copy-mode-vi V send-keys -X rectangle-toggle
      '';
    };
  };
}
