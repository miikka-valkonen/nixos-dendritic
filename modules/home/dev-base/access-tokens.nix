{
  flake.modules.homeManager.access-tokens = {secrets, ...}: {
    home.file.".config/nix/nix.conf".text = ''
      access-tokens = github.com=${secrets.github.personal_access_token}
    '';
  };
}
