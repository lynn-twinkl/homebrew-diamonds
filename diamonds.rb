class Diamonds < Formula
  desc "Terminal project color and URL manager"
  homepage "https://github.com/lynn-twinkl/diamonds"
  url "https://github.com/lynn-twinkl/diamonds/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "38dffc68f05d1dfe8db7061c9ee1fddc215144f64b64efdd2c7f63cf8b3c3aa4"
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
