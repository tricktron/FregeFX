{
    description            = "fregefx-dev-shell";
    inputs.flake-utils.url = "github:numtide/flake-utils";
    inputs.nixpkgs.url     = "github:NixOS/nixpkgs";

    outputs = 
    {
        self,
        nixpkgs,
        flake-utils 
    }:
    flake-utils.lib.eachSystem
    [
        "x86_64-darwin" 
        "aarch64-darwin" 
        "x86_64-linux" 
    ]
    (system:
        let pkgs = import nixpkgs { inherit system; };
    in
    {
        devShell = pkgs.mkShell
        {
            buildInputs =
            [
                (pkgs.openjdk8.override { enableJavaFX = true; })
            ];
        };
    });
}
