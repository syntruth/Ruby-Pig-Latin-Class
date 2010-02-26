#!/usr/bin/env ruby

class PigLatin
  @cache = {}

  attr_accessor :text
  attr_accessor :output

  def initalize(text="")
    @text = text
    @output = ""
    self.encode()
  end

  def add_text(text="")
    @text += text
  end

  def clear
    @text = ""
    @cache = {}
  end

  def encode
    output = []

    @text.each_line do |line|
      line.gsub!(/\b(\w+)\b/) do |match|
        word = $1

        if not cache.has_key?(word)
          # Ignore words that start with _ or *
          if word.match(/^[_*]/)
            pig_latin = word
          else

            is_caps = (word[0].chr.upcase == word[0].chr) ? true : false

            if word.match(/^[aieou]/)
              pig_latin = word + "way"
            else
              pig_latin = word[1..-1] + word[0].chr + "ay"
            end
          end

          pig_latin.downcase!
          pig_latin.capitalize! if is_caps

          # Add to cache
          cache[word] = pig_latin
        end

        # 'return' the pig-latin word.
        cache[word]
      end

      output.push(line)
    end

    @output = output.join("\n")
  end

# End class
end

