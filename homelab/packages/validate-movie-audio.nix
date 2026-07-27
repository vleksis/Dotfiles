{
  ffmpeg-headless,
  lib,
  writeShellApplication,
}:

writeShellApplication {
  name = "validate-movie-audio";
  runtimeInputs = [ ffmpeg-headless ];
  text = builtins.readFile ./validate-movie-audio.sh;

  meta = {
    description = "Validate required English/Japanese and Russian movie audio streams";
    license = lib.licenses.mit;
    platforms = lib.platforms.unix;
  };
}
