class Snip < Formula
  desc "Save and re-run shell commands with an interactive picker"
  homepage "https://github.com/cahyasetya/snip"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cahyasetya/snip/releases/download/v0.3.1/snip-v0.3.1-aarch64-macos.tar.gz"
      sha256 "cba499debf29fb34cf4686fc184da4648b0f269ccb3b4edccf4d043c74324143"
    else
      url "https://github.com/cahyasetya/snip/releases/download/v0.3.1/snip-v0.3.1-x86_64-macos.tar.gz"
      sha256 "2234ef261f3b3d8fd7c3523c649278482cb3453727627143610468e53a7698e0"
    end
  end

  on_linux do
    url "https://github.com/cahyasetya/snip/releases/download/v0.3.1/snip-v0.3.1-x86_64-linux.tar.gz"
    sha256 "d5fdfcf11834d69b8456b76302024d38ed9c76ad7058ce0d4bc3bbbcbc869167"
  end

  def install
    bin.install "snip"
  end

  test do
    assert_path_exists bin/"snip"
  end
end
