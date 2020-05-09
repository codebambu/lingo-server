letter_count = nil

Dir.foreach('raw_words') do |filename|
  next if filename == '.' or filename == '..'
  # get the letter from the filename
  letter = filename.gsub('.txt', '')
  # p letter
  # exit
  # make direcotry
  File.readlines("raw_words/#{filename}").each do |line|

    if (line) 
      line = line.chomp
      first_character = line[0]
      
      if (first_character.to_i != 0) 
        letter_count = first_character
        next
      end
      p letter_count
      word = line
      path = "words/#{letter_count}/#{letter}.txt"
      system("touch #{path}")
      puts "touch '#{path}'"

      puts "put '#{word}' into '#{path}'"
      open(path, 'a') do |file|
        file.puts word
      end
    end
  end
end
