{config, ...}: {
  configurations.homeManager.work = {
    hostModule = {pkgs, ...}: {
      imports = with config.flake.modules.homeManager; [
        dev-base
        dev-extra

        aerc
      ];

      home.packages = [
        (pkgs.writeShellScriptBin "xdg-open" ''
          url=$(printf '%s' "$1" | sed "s/'/\\'\\'/g")
          exec powershell.exe -NoProfile -Command "Start-Process '$url'" 2>/dev/null
        '')
        (pkgs.writeShellScriptBin "print_branch" ''
          branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || exit 0
          clean_branch=''${branch#feature/}
          printf '%s\n' "$clean_branch"
        '')
      ];
    };
  };
}
