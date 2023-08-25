class MedhashTools < Formula
    desc "Simple tools for verifying media file integrity."
    homepage "https://github.com/Ghifari160/medhash-tools"
    url "https://github.com/Ghifari160/medhash-tools/archive/0.6.0.tar.gz"
    sha256 "91a24fb362903efb9fc4b1658c4d8d1de3042399f54a7b66ec8d44fe5d27ccab"
    license "MIT"
    version "0.6.0"
    head "https://github.com/Ghifari160/medhash-tools.git", branch: "main"

    depends_on "go" => :build

    bottle do
        root_url "https://bottles.gassets.space/tools"
        sha256 cellar: :any_skip_relocation, ventura:      "47b83a4fe0e6fb7fa171be8e309b28fe87a66386bed5cbdf7b6eee78f46fde6f"
        sha256 cellar: :any_skip_relocation, monterey:     "47b83a4fe0e6fb7fa171be8e309b28fe87a66386bed5cbdf7b6eee78f46fde6f"
        sha256 cellar: :any_skip_relocation, big_sur:      "47b83a4fe0e6fb7fa171be8e309b28fe87a66386bed5cbdf7b6eee78f46fde6f"
        sha256 cellar: :any_skip_relocation, x86_64_linux: "c084b5b4f7a0bc821d22ab879d6f79fdea477330ccaa8b49353cc455d8054b89"
    end

    def install
        ldflags = %W[
            -s -w
        ]

        system "go", "build", *std_go_args(output: "#{bin}/medhash", ldflags: ldflags), "."
    end

    test do
        assert_match "MedHash Tools #{version}", shell_output("#{bin}/medhash-tools version")
    end
end
