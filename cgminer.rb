class Cgminer < Formula
  desc "cgminer"
  homepage "https://kano.is/"
  url "https://github.com/kanoi/cgminer.git", :branch => "master"
  version "4.13.1"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "coreutils" => :build
  depends_on "curl"
  depends_on "libusb"

  def install
    system "autoreconf -fi"
    system "./autogen.sh", "--disable-debug",
                           "--disable-dependency-tracking",
                           "--prefix=#{prefix}",
                           "PKG_CONFIG_PATH=#{HOMEBREW_PREFIX}/opt/curl/lib/pkgconfig:#{HOMEBREW_PREFIX}/opt/jansson/lib/pkgconfig:#{HOMEBREW_PREFIX}/opt/libusb/lib/pkgconfig",
                           "--enable-gekko"
    system "make", "install"
  end

  test do
    system "false"
  end
end
