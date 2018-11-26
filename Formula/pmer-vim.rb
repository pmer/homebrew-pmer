class PmerVim < Formula
  url "https://github.com/pmer/vim/archive/1.tar.gz"
  sha256 "d60118264cd89f1614444da76129d0ad30deb006aa17123d64ba42833207a920"

  head "https://github.com/pmer/vim"

  def install
    system "./configure", "--prefix=#{HOMEBREW_PREFIX}",
                          "--mandir=#{man}",
                          "--enable-multibyte",
                          "--enable-rubyinterp",
                          "--with-tlib=ncurses",
                          "--disable-nls",
                          "--enable-gui=no",
                          "--without-x"

    system "make"

    ENV.deparallelize

    system "make", "install", "prefix=#{prefix}"
  end
end
