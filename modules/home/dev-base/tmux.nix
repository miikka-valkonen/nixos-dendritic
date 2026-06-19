{
  flake.modules.homeManager.tmux = {pkgs, ...}: {
    programs.tmux = {
      enable = true;
      plugins = with pkgs.tmuxPlugins; [
        minimal-tmux-status
        copy-toolkit
      ];

      extraConfig = ''
        set-option -g default-command "env -u __ETC_PROFILE_NIX_SOURCED $SHELL"
        set-window-option -g mode-keys vi
        set-option -sg escape-time 10
        set-option -g focus-events on
        set-option -g default-terminal "screen-256color"
        set-option -g set-clipboard on
        bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "wl-copy"
      '';
    };
  };
}
