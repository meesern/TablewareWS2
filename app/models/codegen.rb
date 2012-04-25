
class Codegen
  def initialize(params={})
    @min_regions = params[:min_branches] ||= 8
    @max_regions = params[:max_branches] ||= 8
    @empties =     params[:empty_branches] ||= 0
    @validation_regions = params[:validation_branches] ||= 4
    @max_blobs =   params[:max_leaves] ||= 6
    @validation_value =   params[:validation_branch_leaves] ||= 1
    @checksum_value = params[:checksum] ||= params[:max_leaves]
    @codes = nil
  end

  def codes
    @codes ||= enumerate_all
  end

  def enumerate_all
    @codes = []
    (@min_regions..@max_regions).each{ |regions|
      @codes += enumerate(regions-@validation_regions)
    }
    @codes
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

  def length
    self.codes.length
  end

end

