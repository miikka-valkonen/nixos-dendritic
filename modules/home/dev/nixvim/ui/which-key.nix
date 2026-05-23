{
  flake.modules.homeManager.nixvim = {
    programs.nixvim.plugins.which-key = {
      enable = true;
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>b";
            desc = "+buffers";
          }
          {
            __unkeyed-1 = "<leader>c";
            desc = "+code/context";
          }
          {
            __unkeyed-1 = "<leader>f";
            desc = "+find/file";
          }
          {
            __unkeyed-1 = "<leader>g";
            desc = "+git";
          }
          {
            __unkeyed-1 = "<leader>gr";
            desc = "+resets";
          }
          {
            __unkeyed-1 = "<leader>gs";
            desc = "+stage";
          }
          {
            __unkeyed-1 = "<leader>gt";
            desc = "+toggles";
          }
          {
            __unkeyed-1 = "<leader>s";
            desc = "+search";
          }
          {
            __unkeyed-1 = "<leader>t";
            desc = "+tabs";
          }
        ];
      };
    };
  };
}
