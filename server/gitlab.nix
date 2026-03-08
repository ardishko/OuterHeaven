{
  services = {
    gitlab = {
      enable = true;
      port = 6967;
      databaseHost = "";
      databasePasswordFile = "/etc/cred/gitlab/dbPasswd";
      initialRootPasswordFile = "/etc/cred/gitlab/rootPassword";
      pages = {
        enable = true;
        settings = {
          pages-domain = "pages.ardishco.net";
        };
      };
      secrets = {
        secretFile = "/etc/cred/gitlab/secret";
        dbFile = "/etc/cred/gitlab/db";
        otpFile = "/etc/cred/gitlab/otp";
        jwsFile = "/etc/cred/gitlab/jws";
        activeRecordPrimaryKeyFile = "/etc/cred/gitlab/activeRecordPrimaryKey";
        activeRecordDeterministicKeyFile = "/etc/cred/gitlab/activeRecordDeterministicKey";
        activeRecordSaltFile = "/etc/cred/gitlab/activeRecordSalt";
      };
    };
    gitlab-runner = {
      enable = true;
    };
  };
}
