class AdsController < ApplicationController

  def root
    redirect_to "/ads" and return
  end

  def ads
    @ads = Ad.all
    render :index and return
  end

  def show
    @ad = Ad.find(params[:id])
    render :show and return
  end

  def new
    @ad = Ad.new
    render :new and return
  end

  def edit
    @ad = Ad.find(params[:id])
    render :edit and return
  end

  def new_post
    @ad              = Ad.new
    @ad.company_name = params[:company_name]
    @ad.duration     = params[:duration]

    if @ad.save == true
      flash[:notice] = "Ad was successfully created."
      redirect_to "/ads/#{@ad.id}"
    else
      render :new and return
    end
  end

  def edit_post
    @ad              = Ad.find(params[:id])
    @ad.company_name = params[:company_name]
    @ad.duration     = params[:duration]

    if @ad.save == true
      flash[:notice] = "Ad was successfully updated."
      redirect_to "/ads/#{@ad.id}"
    else
      render :edit and return
    end
  end

  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy
    redirect_to "/ads" and return
  end

end
