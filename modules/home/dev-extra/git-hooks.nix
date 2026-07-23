{
  flake.modules.homeManager.git-hooks = {
    programs.git.settings.core.hooksPath = "~/git-hooks";

    home.file."git-hooks/pre-commit" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash

        # Check double comments
        if git diff -p -M --cached HEAD -- | grep '^+' | grep -E '//\s*//'; then
          echo 'Preventing commit, because double comments'
          exit 1
        fi

        # Check formatting
        git diff --cached --name-only --diff-filter=ACM -z *.fs | xargs -0 -r dotnet fantomas --check
      '';
    };

    home.file."git-hooks/prepare-commit-msg" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash

        FILE="$1"
        MESSAGE=$(cat "$FILE")

        # Extract ticket number from branch (e.g., feature/12345 -> 12345)
        BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
        TICKET=''${BRANCH_NAME#feature/}

        # Only add if numeric
        if ! [ "$TICKET" -eq "$TICKET" ] 2>/dev/null; then
          echo "$TICKET isn't numeric, not adding ref to ticket"
          exit 0
        fi

        # Check if a line exactly matches "#<ticket>"
        echo "$MESSAGE" | grep -qx "#$TICKET" && exit 0

        # Append the ticket reference
        printf "%s\n\n#%s\n" "$MESSAGE" "$TICKET" >"$FILE"
      '';
    };
  };
}
