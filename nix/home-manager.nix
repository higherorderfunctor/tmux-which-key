{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) types;
  cfg = config.programs.tmux.tmux-which-key;
  rtpPath = "tmux-plugins/tmux-which-key";
  # itemType = rec {
  #   name = str;
  #   key = str;
  #   menu = listOf itemType;
  #   macro = str;
  #   command = str;
  #   transient = bool;
  #   separator = bool;
  # };
  # item = itemType;
  # keybindings = {
  #   prefix_table = str;
  #   root_table = str;
  # };
  # #   title:
  # #     type: object
  # #     title: The menu title config (optional)
  # #     properties:
  # #       style:
  # #         type: string
  # #         title: The title style
  # #         examples:
  # #           - "align=centre,bold"
  # #       prefix:
  # #         type: string
  # #         default: tmux
  # #         title: A prefix added to every menu title
  # #         examples:
  # #           - tmux
  # #       prefix_style:
  # #         type: string
  # #         title: The style of the title prefix
  # #         examples:
  # #           - "fg=green,align=centre,bold"
  # title = lib.types.submodule {
  #   options = {
  #     style = lib.mkOption {
  #       type = types.str;
  #       description = "The title style";
  #       example = "align=centre,bold";
  #     };
  #     prefix = types.str;
  #     prefix_style = types.str;
  #   };
  # };
  # position = {
  #   x = enum ["C" "R" "P" "M" "W"];
  #   y = enum ["C" "P" "M" "W" "S"];
  # };
  # custom_variable = {
  #   name = str;
  #   value = str;
  # };
  # macro = {
  #   name = str;
  #   commands = listOf str;
  # };
in {
  #   item:
  #     type: object
  #     title: The item config
  #     oneOf:
  #       - type: object
  #         title: A submenu
  #         required:
  #           - name
  #           - key
  #           - menu
  #         properties:
  #           name:
  #             type: string
  #             title: The submenu name
  #             examples:
  #               - +My menu
  #           key:
  #             type: string
  #             title: The key that opens this submenu
  #             examples:
  #               - C-m
  #           menu:
  #             type: array
  #             title: The submenu items
  #             items:
  #               $ref: "#/$defs/item"
  #             examples: []
  #         examples:
  #           - name: Last pane
  #             key: Space
  #             command: last-pane
  #       - type: object
  #         title: A macro defined by the user
  #         required:
  #           - name
  #           - key
  #           - macro
  #         properties:
  #           name:
  #             type: string
  #             title: The item name
  #             examples:
  #               - My macro
  #           key:
  #             type: string
  #             title: The key that triggers this macro
  #             examples:
  #               - M
  #           macro:
  #             type: string
  #             title: The macro to run
  #             examples:
  #               - my-macro
  #           transient:
  #             type: boolean
  #             default: false
  #             title: >-
  #               Whether the menu stays open after running this item (transient
  #               keybinding)
  #             examples:
  #               - false
  #               - true
  #         examples:
  #           - name: My macro
  #             key: M
  #             command: my-macro
  #       - type: object
  #         title: A command
  #         required:
  #           - name
  #           - key
  #           - command
  #         properties:
  #           name:
  #             type: string
  #             title: The item name
  #             examples:
  #               - Last pane
  #           key:
  #             type: string
  #             title: The key that triggers this command
  #             examples:
  #               - Space
  #           command:
  #             type: string
  #             title: The command to run
  #             examples:
  #               - last-pane
  #           transient:
  #             type: boolean
  #             default: false
  #             title: >-
  #               Whether the menu stays open after running this item (transient
  #               keybinding)
  #         examples:
  #           - name: Last pane
  #             key: Space
  #             command: last-pane
  #       - type: object
  #         title: A menu separator
  #         required:
  #           - separator
  #         properties:
  #           separator:
  #             type: boolean
  #             default: true
  #             title: Whether the item is a separator
  #         examples:
  #           - separator: true
  # required:
  #   - command_alias_start_index
  #   - keybindings
  #   - items
  # properties:
  #   command_alias_start_index:
  #     type: integer
  #     default: 200
  #     minimum: 200
  #     title: >-
  #       The starting index to use for the command-alias option, used for macros
  #       (required). This value must be at least 200
  #     examples:
  #       - 200
  #   keybindings:
  #     type: object
  #     default:
  #       prefix_table: Space
  #       root_table: C-Space
  #     title: The keybindings that open the which-key menu
  #     required:
  #       - prefix_table
  #     properties:
  #       prefix_table:
  #         type: string
  #         default: Space
  #         title: The keybinding for the prefix key table
  #         examples:
  #           - Space
  #       root_table:
  #         type: string
  #         default: C-Space
  #         title: The keybinding for the root key table
  #         examples:
  #           - C-Space
  #     examples:
  #       - prefix_table: Space
  #         root_table: C-Space
  #     examples:
  #       - style: "align=centre,bold"
  #         prefix: tmux
  #         prefix_style: "fg=green,align=centre,bold"
  #   position:
  #     type: object
  #     default:
  #       x: R
  #       y: P
  #     title: The menu position (optional)
  #     properties:
  #       x:
  #         type: string
  #         default: R
  #         title: The x location of the menu
  #         enum: [C, R, P, M, W]
  #         examples:
  #           - R
  #       y:
  #         type: string
  #         default: P
  #         title: The y location of the menu
  #         enum: [C, P, M, W, S]
  #         examples:
  #           - P
  #     examples:
  #       - x: R
  #         y: P
  #   custom_variables:
  #     type: array
  #     title:
  #       tmux-only environment variables that can be used in commands and macros
  #     properties:
  #       name:
  #         type: string
  #         title: The environment variable name
  #       value:
  #         type: string
  #         title: The environment variable value
  #         examples:
  #           - my_env_var: my_value
  #     examples:
  #       - - my_env_var: my_value
  #   macros:
  #     type: array
  #     title: The user macros
  #     properties:
  #       name:
  #         type: string
  #         title: The macro name
  #         examples:
  #           - my-macro
  #       commands:
  #         type: array
  #         title: The macro commands
  #         items:
  #           type: string
  #           title: A command value
  #           examples:
  #             - source-file $HOME/.tmux.conf
  #         examples:
  #           - - 'display "[info] Loading config... "'
  #             - source-file $HOME/.tmux.conf
  #             - 'display -p "[info] Done\n\n... Press <Enter> to close"'
  #             - 'display "[info] Config loaded "'
  #     examples:
  #       - reload-config:
  #           - 'display "[log_info] Loading config... "'
  #           - source-file $HOME/.tmux.conf
  #           - 'display -p "[info] Done\n\n... Press <Enter> to close"'
  #           - 'display "[log_info] Config loaded "'
  #   items:
  #     type: array
  #     title: The menu items
  #     items:
  #       $ref: "#/$defs/item"
  #     examples:
  #       - - name: My command
  #           key: Space
  #           command: next-pane
  options.programs.tmux.tmux-which-key = {
    enable = lib.mkEnableOption "tmux-which-key";
    package = lib.mkPackageOption pkgs ["tmuxPlugins" "tmux-which-key"] {};
    settings = lib.mkOption {
      type = with lib.types; let
        valueType =
          nullOr (oneOf [
            bool
            int
            float
            str
            path
            (attrsOf valueType)
            (listOf valueType)
          ])
          // {
            description = "tmux-which-key configuration value";
          };
      in
        valueType;
      default = let
        fromYaml = file: let
          convertedJson =
            pkgs.runCommandNoCC "config.json" {
              nativeBuildInputs = [pkgs.yj];
            } ''
              ${lib.getExe pkgs.yj} < ${file} > $out
            '';
        in
          builtins.fromJSON (builtins.readFile "${convertedJson}");
      in
        fromYaml "${cfg.package}/share/tmux-plugins/tmux-which-key/config.example.yaml";
    };
  };

  config = let
    configYaml = lib.generators.toYAML {} cfg.settings;
    configTmux =
      pkgs.runCommandNoCC "init.tmux" {
        nativeBuildInputs = cfg.package.propagatedBuildInputs;
      } ''
        set -x
        echo '${configYaml}' > config.yaml
        python3 "${cfg.package}/share/tmux-plugins/tmux-which-key/plugin/build.py" \
          config.yaml $out
      '';
  in
    lib.mkIf cfg.enable {
      xdg = {
        configFile."${rtpPath}/config.yaml".text = configYaml;
        dataFile."${rtpPath}/init.tmux".source = configTmux;
      };
      programs.tmux.plugins = [
        {
          plugin = cfg.package;
          extraConfig = ''
            set -g @tmux-which-key-xdg-enable 1;
            set -g @tmux-which-key-disable-autobuild 1
            set -g @tmux-which-key-xdg-plugin-path "${rtpPath}"
          '';
        }
      ];
    };
}
