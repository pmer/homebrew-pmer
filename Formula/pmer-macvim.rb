class PmerMacvim < Formula
  url "https://github.com/pmer/macvim/archive/1.tar.gz"
  sha256 "94181e0b7d952088b37bba7b1e9da9b9c779edeeca7c9c7a65758b5c4d76cdf8"

  head "https://github.com/pmer/macvim"

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
    executables = %w[
      ex rview rvim view vim vimdiff
      mvimdiff xxd mvimdiff mview mvimex gvim gvimdiff gview gvimex
    ]
    executables.each { |e| bin.install_symlink "mvim" => e }
  end
end
