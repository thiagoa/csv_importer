require 'open-uri'

class UnoptimizedCsvImporter
  include Sidekiq::Worker

  def perform(url)
    file = nil

    Benchmark.realtime do
      file = download_file(url)
    end

    Benchmark.realtime do
      import_csv(contents)
    end

    file.close
  end

  private

  def download_file(url)
    open(url).read
  end

  def import_csv(file)
    file = CsvFile.new(file)
    file.parse_each { |batch| import_batch(batch) }
  end

  def import_batch(batch)
    records = batch.map do |row|
      data = row.to_h
      data.delete('sale_date')
      RealEstateTransaction.new(data)
    end

    RealEstateTransaction.import(records)
  end
end
