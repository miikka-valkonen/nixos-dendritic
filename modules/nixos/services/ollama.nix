{
  flake.modules.nixos.ollama =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      options.ollama.acceleration = lib.mkOption {
        type = lib.types.package;
        default = pkgs.ollama-vulkan;
        description = "The specific Ollama acceleration package to use.";
      };

      config = {
        services.ollama = {
          enable = true;
          package = config.ollama.acceleration;
        };
      };
    };
}
