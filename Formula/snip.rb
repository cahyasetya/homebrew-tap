class Snip < Formula
  desc "Save and re-run shell commands with an interactive picker"
  homepage "https://github.com/cahyasetya/snip"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cahyasetya/snip/releases/download/v0.3.0/snip-v0.3.0-aarch64-macos.tar.gz"
      sha256 "36564452839b38ddcbd87dff2e8e8da488df97f1e36779723f5ce314d8d1e989"
    else
      url "https://github.com/cahyasetya/snip/releases/download/v0.3.0/snip-v0.3.0-x86_64-macos.tar.gz"
      sha256 "7b33fa543e1ea4839f3ad38be974b6c9b238bf3db8915541c0d4f080f2a754bc"
    end
  end

  on_linux do
    url "https://github.com/cahyasetya/snip/releases/download/v0.3.0/snip-v0.3.0-x86_64-linux.tar.gz"
    sha256 "2bd50933c9bc28e380e602715e61c40c375385ed3d7f9a787837e01ade5cbfa3"
  end

  def install
    bin.install "snip"
  end

  test do
    assert_path_exists bin/"snip"
  end
end
