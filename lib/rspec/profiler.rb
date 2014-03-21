require "rspec/profiler/version"

module RSpec
  module Profiler
    class ExampleProfile
      attr_accessor :metadata, :file, :line, :execution_time

      def initialize(example)
        self.metadata = example.metadata
        self.file     = metadata[:file_path]
        self.line     = metadata[:line_number]
      end

      def to_a
        [ file, line_number, execution_time ]
      end
    end

    def self.profile!(config)
      $profiles = []
      config.around       &method(:around)
      config.after :all,  &method(:after_all)
    end

    def self.around(example)
      prof  = ExampleProfile.new(example)
      t0    = Time.now

      example.run

      prof.execution_time = Time.now - t0
      $profiles << prof
    end

    def self.after_all(context)
      puts "\n\n"
      puts "Ten slowest examples:"
      $profiles.sort_by(&:execution_time).reverse.first(10).each do |prof|
        puts "#{'%30s' % prof.file}:#{prof.line}\t#{prof.execution_time}s"
      end

      puts "\n\n"
      puts "Ten biggest spec files:"
      $profiles.group_by(&:file).map { |f, ps| [f, ps.size] }.sort_by(&:last).reverse.first(10).each do |file, num|
        puts "#{'%30s' % file}\t#{num} examples"
      end
      puts "Done."
    end
  end
end
