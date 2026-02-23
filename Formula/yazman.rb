class Yazman < Formula
  desc "Türkçe teknik makale yazım denetleyicisi — yerel LLM + RAG ile"
  homepage "https://github.com/alpozcan/yazman"
  url "https://github.com/alpozcan/yazman/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "96f155bdd235c27ba15195e72f3c9a8f7ade451b63a3110c385ffc08ac9d977e"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos
  depends_on "ollama"

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/yazman"
  end

  test do
    assert_match "USAGE: yazman", shell_output("#{bin}/yazman --help 2>&1")
  end
end
