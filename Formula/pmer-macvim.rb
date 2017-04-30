class PmerMacvim < Formula
  head "https://github.com/pmer/macvim.git"

  def install
    system "./configure", "--enable-multibyte",
                          "--with-macarchs=#{MacOS.preferred_arch}",
                          "--with-tlib=ncurses",
                          "--with-local-dir=#{HOMEBREW_PREFIX}"

    system "make"

    prefix.install "src/MacVim/build/Release/MacVim.app"
    inreplace "src/MacVim/mvim", %r{^# VIM_APP_DIR=\/Applications$},
                                 "VIM_APP_DIR=#{prefix}"
    bin.install "src/MacVim/mvim"

    # Create MacVim vimdiff, view, ex equivalents
    executables = %w[mvimdiff mview mvimex gvim gvimdiff gview gvimex]
    executables.each { |e| bin.install_symlink "mvim" => e }
  end
end
