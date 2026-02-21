class Snip < Formula
  desc "Save and re-run shell commands with an interactive picker"
  homepage "https://github.com/cahyasetya/snip"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cahyasetya/snip/releases/download/v0.2.1/snip-v0.2.1-aarch64-macos.tar.gz"
      sha256 "bba5cfeba30dba32196d3ed789998d6741916ef949cb0f8da02bb7858513a458"
    else
      url "https://github.com/cahyasetya/snip/releases/download/v0.2.1/snip-v0.2.1-x86_64-macos.tar.gz"
      sha256 "c417c82e2a65e09eb318119c10c6a4860d0d266a14f333d513a13ce3eb06ac8a"
    end
  end

  on_linux do
    url "https://github.com/cahyasetya/snip/releases/download/v0.2.1/snip-v0.2.1-x86_64-linux.tar.gz"
    sha256 "06036cb1e98a90be36c6ec14d7aa3b4bded2c062932f38e973b18e5862726626"
  end

  def install
    bin.install "snip"
  end

  test do
    assert_path_exists bin/"snip"
  end
end
