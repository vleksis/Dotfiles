{ pkgs, ... }:

{
  home.packages = with pkgs; [
    codex
    codex-acp

    exiftool
    ffmpeg
    imagemagick
    pandoc
    poppler-utils
    qpdf
    # tesseract
  ];
}
