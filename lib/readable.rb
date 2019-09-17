module Readable
  def load_photographs(file)
    photographs = CSV.open(file, headers: true, header_converters: :symbol)
    photographs.each do |line|
      @photographs << Photograph.new(line)
    end
  end

  def load_artists(file)
    artists = CSV.open(file, headers: true, header_converters: :symbol)
    artists.each do |line|
      @artists << Artist.new(line)
    end
  end
end
