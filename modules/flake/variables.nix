{ lib, ... }:
{
  options = {
    user = {
      username = lib.mkOption {
        type = lib.types.singleLineStr;
        readOnly = true;
      };
      email = lib.mkOption {
        type = lib.types.singleLineStr;
        readOnly = true;
      };
      hashedPassword = lib.mkOption {
        type = lib.types.str;
        readOnly = true;
      };
    };

    rootHashedPassword = lib.mkOption {
      type = lib.types.str;
      readOnly = true;
    };
  };
}
