class Snip < Formula
  desc "Save and re-run shell commands with an interactive picker"
  homepage "https://github.com/cahyasetya/snip"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cahyasetya/snip/releases/download/v0.2.0/snip-v0.2.0-aarch64-macos.tar.gz"
      sha256 "e86f1274194812952a81104632bc01cfc5ac52b467c046f558acd134d91c1d60"
    else
      url "https://github.com/cahyasetya/snip/releases/download/v0.2.0/snip-v0.2.0-x86_64-macos.tar.gz"
      sha256 "c81feebab32add6146d39840fee7e0b708243daab10707420cf05523094c01bd"
    end
  end

  on_linux do
    url "https://github.com/cahyasetya/snip/releases/download/v0.2.0/snip-v0.2.0-x86_64-linux.tar.gz"
    sha256 "db7b6f43ef24126561fb8407320a1c6af8ef6656509f15f45644d48697d6a884"
  end

  def install
    bin.install "snip"
  end

  test do
    assert_path_exists bin/"snip"
  end
end
