class Snip < Formula
  desc "Save and re-run shell commands with an interactive picker"
  homepage "https://github.com/cahyasetya/snip"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cahyasetya/snip/releases/download/v0.1.4/snip-v0.1.4-aarch64-macos.tar.gz"
      sha256 "599c2d91790dfa71427cec2da0e9fecdf1e4de806c0a9fb0c719babde95c713b"
    else
      url "https://github.com/cahyasetya/snip/releases/download/v0.1.4/snip-v0.1.4-x86_64-macos.tar.gz"
      sha256 "9ab959127b943ec41f535fb59e86d835ba6fc75aca69d8c97f9d29f73e51dc92"
    end
  end

  on_linux do
    url "https://github.com/cahyasetya/snip/releases/download/v0.1.4/snip-v0.1.4-x86_64-linux.tar.gz"
    sha256 "9fea247b1745a6572b92b9b44114fab961e4d33ed38cb2b709d03b1879384c2e"
  end

  def install
    bin.install "snip"
  end

  test do
    assert_path_exists bin/"snip"
  end
end
