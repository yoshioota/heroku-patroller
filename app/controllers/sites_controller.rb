class SitesController < ApplicationController

  before_action :set_site, only: [:show, :edit, :update, :destroy, :check]

  before_action do
    if action_name == 'index'
      add_breadcrumb 'サイト一覧'
    else
      add_breadcrumb 'サイト一覧', sites_path
    end
  end

  def index
    @sites = Site.includes(:results).all
  end

  def show
    add_breadcrumb @site.url
  end

  def new
    @site = Site.new
  end

  def edit
    add_breadcrumb @site.url, site_path(@site)
    add_breadcrumb 'Edit'
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to @site, notice: 'Site was successfully created.'
    else
      render :new
    end
  end

  def update
    if @site.update(site_params)
      redirect_to @site, notice: 'Site was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @site.destroy
    redirect_to sites_url, notice: 'Site was successfully destroyed.'
  end

  def check
    PatrolService.patrol(@site, true)
    redirect_to action: :show
  end

  private

  def set_site
    @site = Site.find(params[:id])
  end

  def site_params
    params.require(:site).permit(:url)
  end
end
