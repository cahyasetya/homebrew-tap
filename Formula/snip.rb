class Snip < Formula
  desc "Save and re-run shell commands with an interactive picker"
  homepage "https://github.com/cahyasetya/snip"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cahyasetya/snip/releases/download/v0.1.0/snip-v0.1.0-aarch64-macos.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/cahyasetya/snip/releases/download/v0.1.0/snip-v0.1.0-x86_64-macos.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    url "https://github.com/cahyasetya/snip/releases/download/v0.1.0/snip-v0.1.0-x86_64-linux.tar.gz"
    sha256 "PLACEHOLDER"
  end

  depends_on "fzf"

  def install
    bin.install "snip"
  end

  test do
    assert_path_exists bin/"snip"
  end
end
