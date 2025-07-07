class Diamonds < Formula
  desc "Terminal project color and URL manager"
  homepage "https://github.com/lynn-twinkl/diamonds"
  url "https://github.com/lynn-twinkl/diamonds/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "797c3648b318a855ab30fa0c7acef7710e1b51163fe7a099ff7b37c346a2162f"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"diamonds", "."
  end

  test do
    # The main TUI app can't be easily tested non-interactively, but this checks it runs.
    assert_match "Project", shell_output("#{bin}/diamonds 2>&1", 1)
  end
end
