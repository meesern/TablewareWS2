
DEV_ERRORS = true

#
# Handle all API requests
#
class ApiController < ApplicationController
  before_filter :allow_cross_domain_access
  respond_to :json, :xml

  def code
    @code = Code.find_by_codepoint(params[:code])
    raise_404 if (@code.nil?)

    if (@code.type == 'offer')
      @target = @code.offer
    else
      @target = @code.dish
    end

    case params[:qualifier]
      when nil
        bare_code
        return
      when 'thumb'
        @imgsize = 'thumb'
      when 'image'
        @imgsize = 'image'
      when 'name','title'
        @attr=:name
      when 'url','url1'
        @attr=:url1
      when 'url2'
        @attr=:url2
      when 'url3'
        @attr=:url3
      else
        raise_404
    end
    attr_code  if @attr
    image_code if @imgsize
  end

  def bare_code
    @person = User.find(params[:person]) unless params[:person].blank?
    @history =  dish_history
  end

  def attr_code
    render :text => @target.send(@attr)
  end

  def image_code
    imagename = @target.thumb if @imgsize == 'thumb'
    imagename = @target.image if @imgsize == 'image'
    send_file RAILS_ROOT+"/public/images/#{imagename}", :type=> 'image/png', :disposition => 'inline' 
  end

  def dish
  end

  def person
  end

  protected

  def dish_history
    {:likes => "***"}
  end


end
