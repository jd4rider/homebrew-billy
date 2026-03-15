# typed: false
# frozen_string_literal: true

class Billy < Formula
  desc "Local AI coding assistant powered by Ollama — no subscription required"
  homepage "https://github.com/jd4rider/billy-app"
  license "MIT"
  version "0.1.0-alpha"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jd4rider/billy-app/releases/download/v#{version}/billy_darwin_arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/jd4rider/billy-app/releases/download/v#{version}/billy_darwin_amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jd4rider/billy-app/releases/download/v#{version}/billy_linux_arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/jd4rider/billy-app/releases/download/v#{version}/billy_linux_amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "billy"
  end

  def caveats
    <<~EOS
      Billy requires Ollama to be installed and running.
      Install Ollama: https://ollama.com

      Or install Billy Full (Ollama bundled):
        curl -fsSL https://raw.githubusercontent.com/jd4rider/billy-app/main/scripts/install.sh | bash -s -- --full

      After installing Ollama, pull a model to get started:
        ollama pull mistral

      Then run:
        billy
    EOS
  end

  test do
    output = shell_output("#{bin}/billy --version")
    assert_match "billy", output
  end
end
