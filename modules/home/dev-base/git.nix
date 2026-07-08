{
  flake.modules.homeManager.git = {user, ...}: {
    programs.git = {
      enable = true;

      settings = {
        user = {
          name = user.username;
          inherit (user) email;
        };
        alias = {
          ec = "config --global -e";
          st = "status";
          co = "checkout";
          cob = "checkout -b";
          com = "checkout master";
          cobf = "!f() { git up; git checkout -b feature/$1 ; }; f";
          up = "!git pull --rebase --prune $@";
          done = "!\"git com; git up; git bc\"";
        };
        core = {
          editor = "nvim";
          commentchar = ";";
          hooksPath = "~/git-hooks";
          autocrlf = "false";
          pager = "delta";
        };
        interactive.diffFilter = "delta --color-only";
        delta.navigate = "true";
        merge.conflictStyle = "zdiff3";
      };
    };
  };
}
