#!/usr/bin/ruby

summaries = IO.read('summaries.txt')

summaries.split(/^### /).each {|s|
  next if s.empty?
  lines = s.strip.split(/\n/)
  title_line = lines[0]

  filename = title_line.match(/\/licenses\/([^\/]+)\//)

  title = title_line.match(/^\[(.*?)\]/)
  unless title && title.length > 0 && filename && filename.length > 0
    next
  end

  filename = filename[1]
  title = title[1]
  content = lines[1..-1].join("\n").strip

  output =<<-EOF
# #{title}

#{content}
  EOF

  File.open("summaries/#{filename}.info", 'w') do |f|
    f.puts output
  end
}
