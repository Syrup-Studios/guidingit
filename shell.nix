{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.git
    (pkgs.python313.withPackages (ps: with ps; [
      mkdocs
      mkdocs-material
      mkdocs-awesome-nav
      mkdocs-git-authors-plugin
      mkdocs-git-revision-date-localized-plugin
      mkdocs-minify-plugin
      pymdown-extensions
    ]))
  ];
}