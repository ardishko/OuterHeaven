{
  # Polkit stuff
  security = {
    pam.services = {
      swaylock.text = "auth include login";
      gtklock.text = "auth include login";
    };
  };
}
