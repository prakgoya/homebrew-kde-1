class Atelier < Formula
  desc "3D printing host"
  homepage "https://atelier.kde.org"
  url "https://download.kde.org/stable/applications/18.04.1/src/kate-18.04.1.tar.xz"
  sha256 "48f17a1fae34da0076c93e784e7dab5297f5a82babe58d5463bdc672b59c6cf5"

  head "git://anongit.kde.org/atelier.git"

  depends_on "cmake" => :build
  depends_on "KDE-mac/kde/kf5-extra-cmake-modules" => :build
  depends_on "KDE-mac/kde/atcore"
  depends_on "KDE-mac/kde/kf5-kconfigwidgets"
  depends_on "KDE-mac/kde/kf5-ki18n"
  depends_on "KDE-mac/kde/kf5-knewstuff"
  depends_on "KDE-mac/kde/kf5-ktexteditor"
  depends_on "KDE-mac/kde/kf5-kxmlgui"
  depends_on "qwt"

  def install
    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
      prefix.install "install_manifest.txt"
    end
  end
end
