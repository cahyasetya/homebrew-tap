class Cdu < Formula
  desc "Interactive TUI disk usage viewer"
  homepage "https://github.com/cahyasetya/cdu"
  version "1.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cahyasetya/cdu/releases/download/v1.0.4/cdu-aarch64-macos"
      sha256 "3903ae29b29083cf27ce161681cc7d505e4a1cfcc333d23222dd07bca17535ad"
    else
      url "https://github.com/cahyasetya/cdu/releases/download/v1.0.4/cdu-x86_64-macos"
      sha256 "20764b2e0fd59a89b8c631f154dee7f35af10ea3f03051822de9fc815fb34a9f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cahyasetya/cdu/releases/download/v1.0.4/cdu-aarch64-linux"
      sha256 "1ae9f64655207ec4ea573b2a15735a9a807476fa301ea6d35f1dede2ca5877c6"
    else
      url "https://github.com/cahyasetya/cdu/releases/download/v1.0.4/cdu-x86_64-linux"
      sha256 "a7b855f3f99ed9bac606d69c403d6a94f6d4e7e92ad27abcc92ed626349a8e48"
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
