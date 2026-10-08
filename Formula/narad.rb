# Narad — queue-first message broker in a single binary.
# Builds from the tagged source; releasing a new version means updating
# `url` and `sha256` below (checksum: `curl -sL <url> | shasum -a 256`).
class Narad < Formula
  desc "Queue-first message broker in a single binary - plain HTTP in, at-least-once out"
  homepage "https://debanganthakuria.github.io/narad/"
  url "https://github.com/DebanganThakuria/narad/archive/refs/tags/v3.2.2.tar.gz"
  sha256 "4ec1c0766e7931f140386bd73e449ceec69d482d40a692178b26f2314c1604ab"
  license "Apache-2.0"
  head "https://github.com/DebanganThakuria/narad.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=v#{version}"), "./cmd/narad"
    generate_completions_from_executable(bin/"narad", "completion")
  end

  test do
    assert_match "narad v#{version}", shell_output("#{bin}/narad version")
  end
end


