# Emit one TSV row per cask per architecture: token, arch, url, sha256.
#
# `brew info --json=v2 --cask` only ever describes the running architecture, so
# an `on_intel` url/sha is invisible on an Apple Silicon machine. Loading each
# cask under a simulated arch is the only way to see both, and it resolves
# `#{version}` / `version.major_minor` interpolation for us.
#
# Run with: brew ruby .github/scripts/dump-cask-artifacts.rb

require "cask/cask_loader"

casks = Dir.glob(File.join(Dir.pwd, "Casks", "*.rb")).sort
abort "no casks found under #{Dir.pwd}/Casks" if casks.empty?

failed = false

casks.each do |path|
  token = File.basename(path, ".rb")

  [:arm, :intel].each do |arch|
    begin
      Homebrew::SimulateSystem.with(arch: arch) do
        cask = Cask::CaskLoader::FromPathLoader.new(path).load(config: nil)
        puts [token, arch, cask.url.to_s, cask.sha256.to_s].join("\t")
      end
    rescue => e
      # A cask that will not load is a hard failure: staying silent here would
      # let an unverifiable cask masquerade as a verified one.
      warn "ERROR loading #{token} (#{arch}): #{e.class}: #{e.message}"
      failed = true
    end
  end
end

exit 1 if failed
