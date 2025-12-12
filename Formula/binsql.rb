class Binsql < Formula
  desc "TUI SQL client for SQLite, Postgres, MSSQL and MySQL"
  homepage "https://github.com/bgunnarsson/binsql"
  url "https://github.com/bgunnarsson/binsql/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "ab6b582d1280de3effc9541f50d53e88a22ace3c55c8b3d5ad6a50842d3cba3c"
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
