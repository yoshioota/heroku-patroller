class ResultsController < ApplicationController

  before_action :set_result, only: [:show, :edit, :update, :destroy]

  before_action do
    if action_name == 'index'
      add_breadcrumb '結果一覧'
    else
      add_breadcrumb '結果一覧', results_path
    end
  end

  def index
    @results = Result.includes(:site).all
  end

  def show
    add_breadcrumb @result.site.url, site_path(@result.site)
    add_breadcrumb '詳細'
  end

  def new
    @result = Result.new
  end

  def edit
  end

  def create
    @result = Result.new(result_params)

    if @result.save
      redirect_to @result, notice: 'Result was successfully created.'
    else
      render :new
    end
  end

  def update
    if @result.update(result_params)
      redirect_to @result, notice: 'Result was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @result.destroy
    redirect_to results_url, notice: 'Result was successfully destroyed.'
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end

  def result_params
    params.require(:result).permit(:site_id, :response_body)
  end
end
