{
  flake.modules.homeManager.fish = {pkgs, ...}: {
    programs.fish = {
      enable = true;
      shellAbbrs = {
        ga = "g -a";
        gall = "g -all";
        gp = "g --full-path";
        gs = "g --total-size --size";
        mux = "tmuxinator";
      };
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
        fish_vi_key_bindings
        if status is-interactive
          if not set -q TMUX
            tmux new-session -A -s main
          end
        end
      '';
    };
    programs.starship = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
