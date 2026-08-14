class Binsql < Formula
  desc "SQL client with a TUI and a scriptable CLI for SQLite, Postgres, MSSQL and MySQL"
  homepage "https://github.com/bgunnarsson/binsql"
  url "https://github.com/bgunnarsson/binsql/archive/refs/tags/v2.0.1.tar.gz"
  sha256 "593516fe106c1f2402c027ac2a3878fff5f3e73e2dbd2a5d30a8796d825c8f64"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/binsql"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/binsql version")

    # Exercise command mode end to end against a throwaway database.
    system bin/"binsql", "exec", "--dsn", "test.db",
           "create table t (id integer primary key, name text); insert into t values (1, 'ok');"
    assert_match "ok", shell_output("#{bin}/binsql query --dsn test.db 'select name from t' -o raw")
  end
end
