# Narad — queue-first message broker in a single binary.
# Builds from the tagged source; releasing a new version means updating
# `url` and `sha256` below (checksum: `curl -sL <url> | shasum -a 256`).
class Narad < Formula
  desc "Queue-first message broker in a single binary - plain HTTP in, at-least-once out"
  homepage "https://debanganthakuria.github.io/narad/"
  url "https://github.com/DebanganThakuria/narad/archive/refs/tags/v2.2.2.tar.gz"
  sha256 "6896ed56b701ae233d9792196a3616b10addbc49619b4b758170ff37a3c4e044"
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


