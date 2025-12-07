class Binsql < Formula
  desc "TUI SQLite client"
  homepage "https://github.com/bgunnarsson/binsql"
  url "https://github.com/bgunnarsson/binsql/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d567782a04678983bf28619635911f285bcc4033670f8b191f45d800b14a88d4"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/binsql"
  end

  test do
    # Simple smoke test – don't hit a real DB
    assert_match "BINSQL", shell_output("#{bin}/binsql 2>&1", 1)
  end
end

