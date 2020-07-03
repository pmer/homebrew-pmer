class PmerMacvim < Formula
  url "https://github.com/pmer/macvim/archive/2.tar.gz"
  sha256 "2adb0f79d469c8554c1cd314cdcb0efcb41989940c127c7ec5b9cf49f3fe8466"

  head "https://github.com/pmer/macvim"

  depends_on :xcode => :build
  depends_on "ruby"

  conflicts_with "macvim"
  conflicts_with "vim"

  def install
    system "./configure", "--enable-multibyte",
                          "--enable-rubyinterp",
                          "--enable-terminal",
                          "--with-tlib=ncurses",
                          "--with-local-dir=#{HOMEBREW_PREFIX}",
                          "--disable-sparkle"

    system "make"

    prefix.install "src/MacVim/build/Release/MacVim.app"
    bin.install_symlink prefix/"MacVim.app/Contents/bin/mvim"

    # Create MacVim vimdiff, view, ex equivalents
    executables = %w[
      vi vim vimdiff
      gvim gvimdiff
      mvimdiff
    ]
    executables.each { |e| bin.install_symlink "mvim" => e }
  end
end
