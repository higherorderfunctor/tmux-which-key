{python, ...}: let
  src = builtins.fetchGit {url = "./";};
in
  prev.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-which-key";
    version = src.rev;
    propagatedBuildInputs = [python];
    src = builtins.fetchGit {url = "./";};
    preInstall = ''
      rm -rf plugin/pyyaml
      cp -r ${python.pkgs.pyyaml.src} plugin/pyyaml
    '';
    rtpFilePath = "plugin.sh.tmux";
  }
