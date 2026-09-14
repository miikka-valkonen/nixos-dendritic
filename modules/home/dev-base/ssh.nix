{
  flake.modules.homeManager.ssh = {user, ...}: {
    programs.ssh = {
      enable = true;

      # ** WARNING: connection is not using a post-quantum key exchange algorthm.
      # ** This session may be vulnerable to "store now, decrypt later" attacks.
      # ** The server may need to be upgraded. See https://openssh.com/pq.html
      extraConfig = ''
        Host *
            LogLevel ERROR
      '';
    };
  };
}
