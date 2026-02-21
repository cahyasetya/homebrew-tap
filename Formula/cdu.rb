class Cdu < Formula
  desc "Interactive TUI disk usage viewer"
  homepage "https://github.com/cahyasetya/cdu"
  version "1.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cahyasetya/cdu/releases/download/v1.0.4/cdu-v1.0.4-aarch64-macos.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/cahyasetya/cdu/releases/download/v1.0.4/cdu-v1.0.4-x86_64-macos.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cahyasetya/cdu/releases/download/v1.0.4/cdu-v1.0.4-aarch64-linux.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/cahyasetya/cdu/releases/download/v1.0.4/cdu-v1.0.4-x86_64-linux.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "cdu"
  end

  test do
    assert_path_exists bin/"cdu"
  end
end
