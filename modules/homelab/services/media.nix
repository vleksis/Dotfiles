{ inventory, pkgs, ... }:

let
  media = inventory.services.media;
  validateMovieAudio = pkgs.callPackage ../packages/validate-movie-audio.nix { };
in
{
  users = {
    groups.media = { };

    users = {
      jellyfin.extraGroups = [ "media" ];
      vleksis.extraGroups = [ "media" ];
    };
  };

  systemd.tmpfiles.rules = [
    "d ${media.paths.root} 2775 root media - -"
    "d ${media.paths.root}/downloads 2775 root media - -"
    "d ${media.paths.downloads} 2775 root media - -"
    "d ${media.paths.series.downloads} 2775 root media - -"
    "d ${media.paths.root}/library 2775 root media - -"
    "d ${media.paths.library} 2775 root media - -"
    "d ${media.paths.series.library} 2775 root media - -"
  ];

  environment.systemPackages = [ validateMovieAudio ];
}
