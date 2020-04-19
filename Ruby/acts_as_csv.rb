class ActsAsCsv
  def initialize
    @result = []
    read
  end

  def read
    file = File.new(self.class.to_s.downcase + '.txt')
    @headers = file.gets.chomp.split(';')

    file.each do |row|
      @result << row.chomp.split(';')
    end
  end

  def headers
    @headers
  end

  def csv_contents
    @result
  end
end

class RubyCsv < ActsAsCsv
end

puts 'Example 1: using basic inheritance'
m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
puts

##################################

class ActsAsCsv2
  def self.acts_as_csv
    define_method 'initialize' do
      @result = []
      read
    end

    define_method 'read' do
      file = File.new('rubycsv.txt')
      @headers = file.gets.chomp.split(';')

      file.each do |row|
        @result << row.chomp.split(';')
      end
    end

    define_method 'headers' do
      @headers
    end

    define_method 'csv_contents' do
      @result
    end
  end
end

class RubyCsv2 < ActsAsCsv2
  acts_as_csv
end

puts 'Example 2: using macros'
m2 = RubyCsv2.new
puts m2.headers.inspect
puts m2.csv_contents.inspect
puts

##################################

module ActsAsCsv3
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    attr_accessor :headers, :csv_contents

    def initialize
      read
    end

    def read
      @csv_contents = []
      file = File.new('rubycsv.txt')
      @headers = file.gets.chomp.split(';')

      file.each do |row|
        @csv_contents << row.chomp.split(';')
      end
    end
  end
end

class RubyCsv3
  include ActsAsCsv3
  acts_as_csv
end

puts 'Example 3: using modules'
m3 = RubyCsv3.new
puts m3.headers.inspect
puts m3.csv_contents.inspect
puts
