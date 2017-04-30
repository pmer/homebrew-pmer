class PmerVim < Formula
  head "https://github.com/pmer/vim.git"

  def install
    system "./configure", "--prefix=#{HOMEBREW_PREFIX}",
                          "--mandir=#{man}",
                          "--enable-multibyte",
                          "--with-tlib=ncurses",
                          "--disable-nls",
                          "--enable-gui=no",
                          "--without-x"

    system "make"

    ENV.deparallelize

    system "make", "install", "prefix=#{prefix}"
  end
end
