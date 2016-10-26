class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(strand2)
    min_size = (strand.size < strand2.size) ? strand.size : strand2.size
    mutations = 0

    min_size.times { |i| mutations += 1 if strand[i] != strand2[i] }

    mutations
  end
end

new =  DNA.new('GGACG')
puts new.hamming_distance('GGTCG')