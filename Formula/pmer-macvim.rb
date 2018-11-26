class PmerMacvim < Formula
  url "https://github.com/pmer/macvim/archive/pmer1.tar.gz"
  sha256 "1f8d203474b7dfd588763e56aa560c9bb12784d1ff9e52f6cc93b3667b4540cf"

  head "https://github.com/pmer/macvim.git"

  def install
    system "./configure", "--enable-multibyte",
                          "--with-macarchs=#{MacOS.preferred_arch}",
                          "--enable-rubyinterp",
                          "--with-tlib=ncurses",
                          "--with-local-dir=#{HOMEBREW_PREFIX}"

    system "make"

    prefix.install "src/MacVim/build/Release/MacVim.app"
    bin.install_symlink prefix/"MacVim.app/Contents/bin/mvim"

    # Create MacVim vimdiff, view, ex equivalents
    executables = %w[mvimdiff mview mvimex gvim gvimdiff gview gvimex]
    executables.each { |e| bin.install_symlink "mvim" => e }
  end
end
