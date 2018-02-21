# frozen_string_literal: true
require "erb"
require "simplecov"

class SimpleCov::Formatter::ERB
  def format(result)
    File.open(File.join(output_filepath), "wb") { |file| file.puts template.result(binding) }
    puts output_message(result)
  end

  def output_filename=(filename)
    @output_filename = filename
  end

  def output_message(result)
    "Coverage report generated for #{result.command_name} to #{output_filepath}. #{result.covered_lines} / #{result.total_lines} LOC (#{result.covered_percent.round(2)}%) covered."
  end

  def erb_file=(filename)
    @erb_file = filename
  end

  def erb_filename=(filename)
    @erb_filename = filename
  end

  def erb_path=(path)
    @erb_path = path
  end

  def self.missed_lines(source_file)
    result = []
    source_file.lines.each_with_index do |line, index|
      result << (index+1) if line.missed?
    end
    result
  end

  def shortened_filename(filename)
    if filename.start_with?(SimpleCov.root)
      filename[SimpleCov.root.length .. -1]
    else
      filename
    end
  end

  private

  def template
    # Path, safe_mode, trim_mode
    ERB.new(File.read(erb_filepath), nil, "-")
  end

  def erb_filename
    @erb_filename || "simplecov.erb"
  end

  def erb_filepath
    @erb_file || File.join(erb_path, erb_filename)
  end

  def erb_path
    @erb_path || File.expand_path("../views", File.dirname(__FILE__))
  end

  def output_filename
    @output_filename || "coverage.txt"
  end

  def output_filepath
    File.join(output_path, output_filename)
  end

  def output_path
    SimpleCov.coverage_path
  end
end
