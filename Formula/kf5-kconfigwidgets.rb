class Kf5Kconfigwidgets < Formula
  desc "Widgets for KConfig"
  homepage "https://www.kde.org"
  url "https://download.kde.org/stable/frameworks/5.48/kconfigwidgets-5.48.0.tar.xz"
  sha256 "09368a0215aafb4a971f8d1f8d1d8913eab323d133a6a8b93bbeae4f065f9676"

  head "git://anongit.kde.org/kconfigwidgets.git"

  depends_on "cmake" => :build
  depends_on "doxygen" => :build
  depends_on "graphviz" => :build
  depends_on "gettext" => :build
  depends_on "KDE-mac/kde/kf5-extra-cmake-modules" => :build
  depends_on "KDE-mac/kde/kf5-kdoctools" => :build

  depends_on "KDE-mac/kde/kf5-kauth"
  depends_on "KDE-mac/kde/kf5-kcodecs"
  depends_on "KDE-mac/kde/kf5-kconfig"
  depends_on "KDE-mac/kde/kf5-kguiaddons"
  depends_on "KDE-mac/kde/kf5-ki18n"
  depends_on "KDE-mac/kde/kf5-kwidgetsaddons"

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
