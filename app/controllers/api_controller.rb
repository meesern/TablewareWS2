
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
    qualify
  end

  def dish
    @target = Dish.find_by_name(params[:dish])
    raise_404 if (@target.nil?)
    qualify
  end

  #Qualify for both code and dish based urls
  def qualify
    case params[:qualifier]
      when nil, 'person'
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
    @person = User.find_by_name(params[:person]) unless params[:person].blank?
    #puts "person is #{@history}"
    if @target.class != Offer and @person
      @history = @person.encounters.where(:dish_id => @target.id)
      #puts "History is #{@history.to_json}"
    end
  end

  def attr_code
    render :text => @target.send(@attr)
  end

  def image_code
    imagename = @target.image.thumb if @imgsize == 'thumb'
    imagename = @target.image if @imgsize == 'image'
    send_file imagename.current_path, :type=> 'image/jpg', :disposition => 'inline' 
  end

  def person
    @person = User.find_by_name(params[:person])
    if @person
      @history = @person.encounters.limit(10)
    end
  end

end
