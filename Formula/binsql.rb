class Binsql < Formula
  desc "TUI SQL client for SQLite, Postgres, MSSQL and MySQL"
  homepage "https://github.com/bgunnarsson/binsql"
  url "https://github.com/bgunnarsson/binsql/archive/refs/tags/1.0.0.tar.gz"
  sha256 "d312fde25e748c39962829ce6819a857a8edd8125e8172a9029ff2c092c3c9cc"
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
