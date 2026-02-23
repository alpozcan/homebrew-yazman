class Yazman < Formula
  desc "Türkçe teknik makale yazım denetleyicisi — yerel LLM + RAG ile"
  homepage "https://github.com/alpozcan/yazman"
  url "https://github.com/alpozcan/yazman/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "3c4d4d20273f336fbc5dd5b7061cfcdeffca2fd442a47fc947aae4097589fa10"
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
