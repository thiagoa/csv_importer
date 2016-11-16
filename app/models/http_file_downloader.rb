class HttpFileDownloader
  def initialize(url, use_ssl: false)
    encoded_url = URI.encode(url)

    @uri = URI(encoded_url)
    @options = { use_ssl: use_ssl }
  end

  def in_chunks
    download_file do |response|
      response.read_body { |chunk| yield chunk }
    end
  end

  private

  def download_file
    Net::HTTP.start(@uri.host, @uri.port, @options) do |http|
      http.request_get(@uri.path) do |response|
        yield response
      end
    end
  end
end
