class MedhashTools < Formula
    desc "Simple tools for verifying media file integrity."
    homepage "https://github.com/Ghifari160/medhash-tools"
    url "https://github.com/Ghifari160/medhash-tools/archive/0.6.1.tar.gz"
    sha256 "1a4e5f8ea1fa6e1325930f9b165aeff7be15ce3ef4f5ab7bf621890f0801c436"
    license "MIT"
    version "0.6.1"
    head "https://github.com/Ghifari160/medhash-tools.git", branch: "main"

    depends_on "go" => :build

    bottle do
        root_url "https://bottles.gassets.space/tools"
        sha256 cellar: :any_skip_relocation, ventura:      "2e4b58d00e2fdd2912f02f9edcffdc699ec29c62f906831c9aea5d64db90f0aa"
        sha256 cellar: :any_skip_relocation, monterey:     "2e4b58d00e2fdd2912f02f9edcffdc699ec29c62f906831c9aea5d64db90f0aa"
        sha256 cellar: :any_skip_relocation, big_sur:      "2e4b58d00e2fdd2912f02f9edcffdc699ec29c62f906831c9aea5d64db90f0aa"
        sha256 cellar: :any_skip_relocation, x86_64_linux: "a76a5677e104a160a5ac617546fa7bae357b5dc6dbe826f4acaf24d8ccba8a74"
    end

    def install
        ldflags = %W[
            -s -w
        ]

        system "go", "build", *std_go_args(output: "#{bin}/medhash", ldflags: ldflags), "."
    end

    test do
        assert_match "MedHash Tools #{version}", shell_output("#{bin}/medhash version")
    end
end
