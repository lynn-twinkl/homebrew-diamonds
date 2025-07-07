class Diamonds < Formula
  desc "Terminal project color and URL manager"
  homepage "https://github.com/lynn-twinkl/diamonds"
  url "https://github.com/lynn-twinkl/diamonds/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "bfa85e8277d874611e6e7c84d2cdf737400204e21112c8bdd5b743e1a7a66355"
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
