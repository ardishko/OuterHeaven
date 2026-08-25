{
  networking.hosts = {
    "74.208.102.182" = [
      "lambda.us-east-1.amazonaws.com"
      "ec2-34-237-73-93.compute-1.amazonaws.com"
      "cognito-identity.us-east-1.amazonaws.com"
      "prod.gamev92.portalworldsgame.com"
    ];
  };

  security.pki.certificateFiles = [
    # rootCA.crt must be in the same folder as the configuration file containing these lines if you wish to copy and paste the configurations as is.
    ./rootCA.crt
  ];
}
