class Pat < Formula
  desc "Cross-platform Winlink client for amateur radio"
  homepage "https://github.com/la5nta/pat"
  url "https://github.com/la5nta/pat.git", tag: "v1.0.0"
  license "MIT"
  head "https://github.com/la5nta/pat.git", branch: "develop"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  service do
    run [opt_bin/"pat", "http"]
    keep_alive true
    log_path var/"log/pat.log"
    error_log_path var/"log/pat.log"
    environment_variables PATH: std_service_path_env
  end

  test do
    assert_match "Pat v#{version}", shell_output("#{bin}/pat version")
  end
end
