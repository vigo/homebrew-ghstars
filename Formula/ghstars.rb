class Ghstars < Formula
  desc "Show GitHub stars count for user!"
  homepage "https://github.com/vigo/ghstars"
  url "https://github.com/vigo/ghstars/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "d0030fb92704a97f19c7246804370c4a2c224ebce539a3f1a7df026aac922f8b"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    require "open3"
    Open3.popen3("#{bin}/ghstars", "-version") do |stdin, stdout, _|
      stdin.close
      assert_equal "0.1.2", stdout.read.strip
    end
  end
end
