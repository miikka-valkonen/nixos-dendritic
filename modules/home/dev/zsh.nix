{
  flake.modules.homeManager.zsh =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        git
        lazygit

        pfetch-rs
      ];

      programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        oh-my-zsh = {
          enable = true;
          plugins = [
            "git"
            "direnv"
          ];
          theme = "jnrowe";
        };

        shellAliases = {
          gs = "git status";
          ga = "git add .";
          gc = "git commit -a -m";
          gps = "git push";
          gpl = "git pull";
          gst = "git stash";
          gsp = "git stash; git pull";
          gcheck = "git checkout";
          gcredential = "git config credential.helper store";
          gg = "lazygit";

          ":q" = "exit";
        };

        initContent = "pfetch";
      };
    };
}
