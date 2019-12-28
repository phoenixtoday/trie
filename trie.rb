class Trie
  class TrieNode
    attr_accessor :is_word, :children

    def initialize
      @is_word = false
      @children = {}
    end
  end

  attr_reader :root

  def initialize
    @root = TrieNode.new
  end

  def insert(word)
    current = root
    word.chars.each_with_index do |char, i|
      if current.children[char].nil?
        current.children[char] = TrieNode.new
      end
      current = current.children[char]
      if i == word.length - 1
        current.is_word = true
      end
    end
  end

  def search(word)
    current = root
    word.chars.each_with_index do |char, i|
      return false unless current.children[char]

      current = current.children[char]
      if i == word.length - 1
        return current.is_word
      end
    end
  end

  def starts_with(prefix)
    current = root
    prefix.chars.each_with_index do |char, i|
      return false unless current.children[char]

      current = current.children[char]
    end
    true
  end
end
