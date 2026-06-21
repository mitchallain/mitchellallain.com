{
  description = "mitchellallain.com — personal blog";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [ pkgs.zola ];
        shellHook = ''
          echo "zola $(zola --version)"
          echo "  zola serve   — local preview at http://localhost:1111"
          echo "  zola build   — build to public/"
        '';
      };
    };
}
