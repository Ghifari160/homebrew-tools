class Migrate < Formula
    desc "Migrate is a file migration tool"
    homepage "https://github.com/ghifari160/migrate"
    license "MIT"
    version "0.2.0"

    on_macos do
        url "https://projects.gassets.space/migrate/v0.2.0/migrate-macos.tar.gz"
        sha256 "5fdba684d39b787e6516f43859c46fe375822826b9ca7253a4dc85d0ed5eb548"
    end

    on_linux do
        url "https://projects.gassets.space/migrate/v0.2.0/migrate-linux_x86.tar.gz"
        sha256 "c2b3fec3397002133761e87b867a2a5b8ce6d34f891f35503687acd965ac6b48"

        on_arm do
            url "https://projects.gassets.space/migrate/v0.2.0/migrate-linux_arm.tar.gz"
            sha256 "05d12c36efca1388b95ad87fb0aa5d56da429473d27f1fe7ee7c928c360a99d8"
        end
    end

    def install
        bin.install "migrate"
    end

    test do
        (testpath/"input/payload.txt").write <<~EOS
            Test file
        EOS

        system bin/"migrate", "generate", "input", "output"
        assert_equal "input/payload.txt;#{(testpath/"output")}\n", shell_output("cat manifest.txt")
    end
end
