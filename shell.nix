{ pkgs ? import <nixpkgs> {} }:

let
  mkdocs-meta-descriptions-plugin = pkgs.python313Packages.buildPythonPackage rec {
    pname = "mkdocs-meta-descriptions-plugin";
    version = "4.1.0";
    format = "wheel";

    src = pkgs.fetchurl {
      url = "https://files.pythonhosted.org/packages/94/54/da9ea958a070aac4bc1bed682f55aa090eff3130af5f59ad83014b2191b3/mkdocs_meta_descriptions_plugin-4.1.0-py3-none-any.whl";
      sha256 = "045qwsas972nkzga7cwidy8sqsvncba5py3y5pw8mr89vv0hgyz1";
    };

    propagatedBuildInputs = with pkgs.python313Packages; [
      beautifulsoup4
      mkdocs
      packaging
      pymdown-extensions
    ];

    doCheck = false;
  };
in

pkgs.mkShell {
  packages = [
    pkgs.git
    (pkgs.python313.withPackages (ps: with ps; [
      mkdocs
      mkdocs-material
      mkdocs-awesome-nav
      mkdocs-git-authors-plugin
      mkdocs-git-revision-date-localized-plugin
      mkdocs-minify-plugin
      pymdown-extensions
      mkdocs-meta-descriptions-plugin
    ]))
  ];
}