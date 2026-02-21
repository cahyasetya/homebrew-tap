class Snip < Formula
  desc "Save and re-run shell commands with an interactive picker"
  homepage "https://github.com/cahyasetya/snip"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cahyasetya/snip/releases/download/v0.2.2/snip-v0.2.2-aarch64-macos.tar.gz"
      sha256 "2fb31b1e04be78324beab099ecdb426a0bd006e0b2061961e93315a17320c743"
    else
      url "https://github.com/cahyasetya/snip/releases/download/v0.2.2/snip-v0.2.2-x86_64-macos.tar.gz"
      sha256 "6f837b2cd5da68fe6f5d3e0c6437a113b369bfba468ab5154c1dc33cba62b4c4"
    end
  end

  on_linux do
    url "https://github.com/cahyasetya/snip/releases/download/v0.2.2/snip-v0.2.2-x86_64-linux.tar.gz"
    sha256 "179a56a24977605e41bd34b72eb37db199ae6a900b1b32061f980305b6d196a5"
  end

  def install
    bin.install "snip"
  end

  test do
    assert_path_exists bin/"snip"
  end
end
