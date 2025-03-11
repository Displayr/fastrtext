{ pkgs ? import <nixpkgs> {}, displayrUtils }:

pkgs.rPackages.buildRPackage {
  name = "fastrtext";
  version = displayrUtils.extractRVersion (builtins.readFile ./DESCRIPTION); 
  src = ./.;
  description = ''
    Learning text representations and text classifiers may rely
    on the same simple and efficient approach. 'fastText' is an open-source, free, 
    lightweight library that allows users to perform both tasks.
    It transforms text into continuous vectors that can later
    be used on many language related task.
    It works on standard, generic hardware (no 'GPU' required).
    It also includes model size reduction feature.
    'fastText' original source code is available 
    at <https://github.com/facebookresearch/fastText>.
  '';

  propagatedBuildInputs = with pkgs.rPackages; [ 
    Rcpp
    assertthat
  ];
}
