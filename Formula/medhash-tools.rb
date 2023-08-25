class MedhashTools < Formula
    desc "Simple tools for verifying media file integrity."
    homepage "https://github.com/Ghifari160/medhash-tools"
    url "https://github.com/Ghifari160/medhash-tools/archive/0.6.0.tar.gz"
    sha256 "91a24fb362903efb9fc4b1658c4d8d1de3042399f54a7b66ec8d44fe5d27ccab"
    license "MIT"
    version "0.6.0"
    head "https://github.com/Ghifari160/medhash-tools.git", branch: "main"

    depends_on "go" => :build

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
