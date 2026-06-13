{
  flake.modules.nixos.sshagent = {
    programs.ssh.startAgent = true;
  };
}
