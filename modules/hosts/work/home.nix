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
      ];
    };
  };
}
