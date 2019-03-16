class PmerBls < Formula
  desc "BLS"
  homepage "https://github.com/herumi/bls"
  url "https://github.com/herumi/bls/archive/f305481.tar.gz"
  sha256 "676b3877e46e22e2aa71877714c4ecf7d54d7480c3a3fb247f5bb34e1e6a3467"
  head "https://github.com/herumi/bls.git"

  version "1"

  depends_on "gmp"
  depends_on "openssl"

  resource "mcl" do
    url "https://github.com/herumi/mcl/archive/4faf7ef.tar.gz"
    sha256 "9408d455215f90c6b91737c7ccd542004316f43ac418f40ff9e833de692af046"

    version "1"
  end

  def install
    (buildpath/".."/"mcl").install resource("mcl")
    system "make", "-C", "../mcl"
    system "make"

    include.install Dir["../mcl/include/*", "include/*"]
    lib.install Dir["../mcl/lib/*", "lib/*"]
  end
end
