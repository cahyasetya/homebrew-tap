class Cdu < Formula
  desc "Interactive TUI disk usage viewer"
  homepage "https://github.com/cahyasetya/cdu"
  version "0.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cahyasetya/cdu/releases/download/v#{version}/cdu-aarch64-macos"
      sha256 ""
    else
      url "https://github.com/cahyasetya/cdu/releases/download/v#{version}/cdu-x86_64-macos"
      sha256 ""
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cahyasetya/cdu/releases/download/v#{version}/cdu-aarch64-linux"
      sha256 ""
    else
      url "https://github.com/cahyasetya/cdu/releases/download/v#{version}/cdu-x86_64-linux"
      sha256 ""
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os_name = OS.mac? ? "macos" : "linux"
    bin.install "cdu-#{arch}-#{os_name}" => "cdu"
  end

  test do
    assert_path_exists bin/"cdu"
  end
end
