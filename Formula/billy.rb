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
      sha256 "a946194eecf381e8752acb614544f5651c7bb000fc76029004274f16e2f7dba2"
    else
      url "https://github.com/jd4rider/billy-app/releases/download/v#{version}/billy_darwin_amd64.tar.gz"
      sha256 "07e88f87e032c205b6428accf97f473c45cb4f3b7520c5b24ce9e674fbcaeaf8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jd4rider/billy-app/releases/download/v#{version}/billy_linux_arm64.tar.gz"
      sha256 "c2b281b22929636eb453f9160cad20def6740c02d45a20e32e519ab847c929f5"
    else
      url "https://github.com/jd4rider/billy-app/releases/download/v#{version}/billy_linux_amd64.tar.gz"
      sha256 "6dbf7072795d11649bba68e6ed0613d4777dd7299769e6f5f726293977be21db"
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

      After installing Ollama, pull Billy's default model:
        ollama pull qwen2.5-coder:7b

      Then run:
        billy
    EOS
  end

  test do
    output = shell_output("#{bin}/billy --version")
    assert_match "billy", output
  end
end
