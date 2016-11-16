require 'csv'

class CsvFile
  def initialize(file)
    file.rewind
    @file = file
  end

  def parse_each(batch_size: 1_000)
    csv.each_slice(batch_size) do |rows|
      yield rows
    end
  end

  private

  def csv
    @csv ||= CSV.new(@file, headers: true)
  end
end
