class Kf5Kross < Formula
  desc "Embedding of scripting into applications"
  homepage "https://api.kde.org/frameworks/kross/html"
  url "https://download.kde.org/stable/frameworks/5.48/portingAids/kross-5.48.0.tar.xz"
  sha256 "18b9085f91c4198d453575f91c7e34e1aeab59ed87cc1142a0349ca838b2b07f"

  head "git://anongit.kde.org/kross.git"

  depends_on "cmake" => :build
  depends_on "KDE-mac/kde/kf5-extra-cmake-modules" => :build
  depends_on "KDE-mac/kde/kf5-kxmlgui" => :build
  depends_on "gettext"
  depends_on "KDE-mac/kde/kf5-kcompletion"
  depends_on "KDE-mac/kde/kf5-kcoreaddons"
  depends_on "KDE-mac/kde/kf5-ki18n"
  depends_on "KDE-mac/kde/kf5-kiconthemes"
  depends_on "KDE-mac/kde/kf5-kio"
  depends_on "KDE-mac/kde/kf5-kparts"
  depends_on "KDE-mac/kde/kf5-kwidgetsaddons"
  depends_on "qt"
  depends_on "KDE-mac/kde/kf5-kdoctools" => :optional

  def install
    args = std_cmake_args
    args << "-DBUILD_TESTING=OFF"
    args << "-DBUILD_QCH=ON"
    args << "-DKDE_INSTALL_QMLDIR=lib/qt5/qml"
    args << "-DKDE_INSTALL_PLUGINDIR=lib/qt5/plugins"
    args << "-DCMAKE_INSTALL_BUNDLEDIR=#{bin}"

    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
      prefix.install "install_manifest.txt"
    end
  end

  def caveats; <<~EOS
    You need to take some manual steps in order to make this formula work:
      mkdir -pv "$HOME/Applications/KDE"
      ln -sfv "$(brew --prefix)/opt/kf5-kross/bin/kf5kross.app" "$HOME/Applications/KDE/"
  EOS
  end

  test do
    assert `$(brew --prefix)/opt/kf5-kross/bin/kf5kross.app/Contents/MacOS/kf5kross --help | grep -- --help` =~ /--help/
  end
end
