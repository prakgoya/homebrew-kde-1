class Kf5Kguiaddons < Formula
  desc "Addons to QtGui"
  homepage "https://www.kde.org"
  url "https://download.kde.org/stable/frameworks/5.48/kguiaddons-5.48.0.tar.xz"
  sha256 "bf81ea49762f05f53dd49493ee0ac7525bcb7e9d33301d45800e11f270c2386e"

  head "git://anongit.kde.org/kguiaddons.git"

  depends_on "cmake" => :build
  depends_on "doxygen" => :build
  depends_on "graphviz" => :build
  depends_on "KDE-mac/kde/kf5-extra-cmake-modules" => :build

  depends_on "qt"

  def install
    args = std_cmake_args
    args << "-DBUILD_TESTING=OFF"
    args << "-DBUILD_QCH=ON"
    args << "-DKDE_INSTALL_QMLDIR=lib/qt5/qml"
    args << "-DKDE_INSTALL_PLUGINDIR=lib/qt5/plugins"

    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
      prefix.install "install_manifest.txt"
    end
  end
end
