class OptimizedCsvImporter
  include Sidekiq::Worker

  def perform(url)
    file = nil

    puts 'Starting UP!!!!!!!!'

    Benchmark.realtime do
      #file = download_file(url)
      file = File.open('/Users/thiago/csv.csv')
    end

    Benchmark.realtime do
      import_csv(file)
    end

    file.close
  end

  private

  def download_file(url)
    tempfile = Tempfile.new(['csv', '.csv'])
    downloader = HttpFileDownloader.new(url, use_ssl: true)
    downloader.in_chunks { |chunk| tempfile << chunk }
    tempfile
  end

  def import_csv(file)
    file = CsvFile.new(file)
    file.parse_each { |batch| import_batch(batch) }
  end

  def import_bach(batch)
    records = batch.map { |row| RealEstateTransaction.new(row) }
    RealEstateTransaction.import(records)
  end
end
