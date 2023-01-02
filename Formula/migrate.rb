class Migrate < Formula
    desc "Migrate is a file migration tool"
    homepage "https://github.com/ghifari160/migrate"
    license "MIT"
    version "0.1.0"

    on_macos do
        url "https://projects.gassets.space/migrate/v0.1.0/migrate-macos-v0.1.0.tar.gz"
        sha256 "c3da4ba5282d2d31603dcd328a484a3f621f4f43a9a91c3f34d34ef595ae6bdb"
    end

    on_linux do
        url "https://projects.gassets.space/migrate/v0.1.0/migrate-linux_386-v0.1.0.tar.gz"
        sha256 "f0a4843fd8868802b9f4407162a76efe00363817931dfe58c86b450e8c2fe94a"

        on_arm do
            url "https://projects.gassets.space/migrate/v0.1.0/migrate-linux_arm-v0.1.0.tar.gz"
            sha256 "fdb59e622c27fdd872b72efa573d0bcc5bac149af3624d3d6cf4dbf5c00e711d"
        end
    end

    def install
        bin.install "migrate"
    end

    test do
        system bin/"migrate", "-version"
    end
end
