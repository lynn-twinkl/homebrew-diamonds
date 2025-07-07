class Diamonds < Formula
  desc "Terminal project color and URL manager"
  homepage "https://github.com/lynn-twinkl/diamonds"
  url "https://github.com/lynn-twinkl/diamonds/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
