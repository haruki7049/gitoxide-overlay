let
  pname = "gitoxide";
in self: super: {
  gitoxide = {
    "0.61.1" = super.rustPlatform.buildRustPackage rec {
      inherit pname;
      version = "0.61.0";

      src = fetchFromGitHub {
        owner = "Byron";
        repo = pname;
        rev = "gix-v${version}";
        hash = "";
      };

      cargoHash = "";

      nativeBuildInputs = [ cmake pkg-config installShellFiles ];

      buildInputs = [ curl ] ++ (if stdenv.isDarwin
        then [ libiconv Security SystemConfiguration ]
        else [ openssl ]);

      env.OPENSSL_NO_VENDOR = 1;
    };
  };
}
