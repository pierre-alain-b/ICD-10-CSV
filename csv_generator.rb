class CSVGenerator
  def generateCSV
    # raw text file from CMS.gov
    text_file = File.open("codes.txt")

    # file for output
    full_csv_file = File.open("codes.csv", "w")

    text_file.each do |line|
      # first six characters
      line_id = line[0..5]

      # DX Code
      code = line[6..13]
      code.strip!

      # category == 0; diagnosis == 1
      diagnosis_type = line[14..15].strip!.to_i

      # abbreviated description
      abbrev = line[16..76]
      abbrev.strip!

      # full description
      full = line[77..-2]
      # edit this line to reformat/rearrange your CSV as desired
      newline = "\"#{code}\",\"#{abbrev}\",\"#{full}\""
      full_csv_file.puts newline
    end
    "csv file successfully created at #{full_csv_file.path}"
  end
end
