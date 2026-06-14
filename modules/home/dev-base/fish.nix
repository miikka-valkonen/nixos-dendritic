{
  flake.modules.homeManager.fish = {pkgs, ...}: {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
        fish_vi_key_bindings
        if status is-interactive
          if not set -q TMUX
            tmux new-session -A -s main
          end
        end
      '';
      plugins = [
        {
          name = "tide";
          src = pkgs.fishPlugins.tide.src;
        }
      ];
    };
  };
}
