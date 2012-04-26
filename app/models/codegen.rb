
class Codegen
  include Enumerable

  attr_reader :min_regions, :max_regions, :empties,
              :validation_regions, :max_blobs,
              :validation_value, :checksum_value 

  def initialize(params={})
    @min_regions = (params[:min_branches] ||= 8).to_i
    @max_regions = (params[:max_branches] ||= 8).to_i
    @empties =     (params[:empty_branches] ||= 0).to_i
    @validation_regions = (params[:validation_branches] ||= 4).to_i
    @max_blobs =   (params[:max_leaves] ||= 6).to_i
    @validation_value =   (params[:validation_branch_leaves] ||= 1).to_i
    @checksum_value = (params[:checksum] ||= params[:max_leaves]).to_i
    @codes = nil
  end

  #keep Hobo happy
  def editable_by?(_,_)
    true
  end
  def [](key)
    ""
  end
  def errors
    @errorlist || []
  end

  def length
    self.codes.length
  end

  def codes
    @codes ||= enumerate_all
  end

  def each
    @codes.each {|c| yield c}
  end

  private
  def enumerate_all
    @codes = []
    (@min_regions..@max_regions).each{ |regions|
      @codes += enumerate(regions-@validation_regions)
    }
    format
  end

  def format
    @codes=@codes.map{|code| code.join(':')}
  end

  def enumerate(regions)
    st = (@empties>0)?0:1
    #without checksum
    arr = (st..@max_blobs).to_a.repeated_combination(regions).map{|a| 
              ([].fill(@validation_value,0,@validation_regions)+a).sort
    }  
    #reject the invalid ones
    arr.reject! {|code| code.reduce('+') % @checksum_value != 0}
    #reject too many empties
    arr.reject! {|code| code[@empties] == 0}
    arr
  end

end

class NilClass
  def dasherize
    nil
  end
end

