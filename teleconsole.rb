class Teleconsole < Formula
  desc "Share your UNIX terminal in seconds"
  homepage "https://www.teleconsole.com"
  url "https://github.com/gravitational/teleconsole/archive/0.3.1.tar.gz"
  sha256 "663307a1dfe4baadf7e1ed9f5b66b1d203bf9696068e9bcd86e535f286e64d59"
  head "https://github.com/gravitational/teleconsole.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    system "go", "get", "github.com/Sirupsen/logrus"
    system "go", "get", "github.com/gravitational/teleconsole/clt"
    system "go", "get", "github.com/gravitational/teleconsole/version"
    system "go", "get", "github.com/gravitational/trace"

    system "go", "build", "-o", "teleconsole"
    bin.install "teleconsole"
  end

  test do
    system "#{bin}/teleconsole", "-v"
  end
end
