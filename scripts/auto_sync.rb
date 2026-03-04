#!/usr/bin/env ruby

require "set"

SOURCE_DIR = File.expand_path("..", __dir__)
DEST_DIR = "/Users/mihato/beatoraja0.8.8-modernchic/skin/GdbG_Skin"
POLL_INTERVAL = 0.5
SYNC_COOLDOWN = 0.3

EXCLUDED_NAMES = Set[
  ".git",
  ".DS_Store",
]

def tracked_files(root)
  files = {}

  Dir.glob(File.join(root, "**", "*"), File::FNM_DOTMATCH).each do |path|
    next if path.end_with?("/.", "/..")

    relative = path.delete_prefix("#{root}/")
    next if relative.empty?

    parts = relative.split("/")
    next if parts.any? { |part| EXCLUDED_NAMES.include?(part) }

    next unless File.file?(path)

    stat = File.stat(path)
    files[relative] = [stat.mtime.to_f, stat.size]
  end

  files
end

def sync!
  command = [
    "rsync",
    "-a",
    "--delete",
    "--exclude", ".git/",
    "--exclude", ".DS_Store",
    "#{SOURCE_DIR}/",
    "#{DEST_DIR}/",
  ]

  success = system(*command)
  timestamp = Time.now.strftime("%Y-%m-%d %H:%M:%S")

  if success
    puts "[#{timestamp}] synced"
  else
    warn "[#{timestamp}] sync failed"
  end
end

def run!
  puts "Watching #{SOURCE_DIR}"
  puts "Sync target: #{DEST_DIR}"

  previous = tracked_files(SOURCE_DIR)
  last_change_at = nil

  loop do
    sleep POLL_INTERVAL
    current = tracked_files(SOURCE_DIR)

    if current != previous
      previous = current
      last_change_at = Time.now
    end

    next unless last_change_at
    next if (Time.now - last_change_at) < SYNC_COOLDOWN

    sync!
    last_change_at = nil
    previous = tracked_files(SOURCE_DIR)
  end
end

if $PROGRAM_NAME == __FILE__
  run!
end
