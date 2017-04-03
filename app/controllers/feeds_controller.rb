class FeedsController < ApplicationController
  before_action :authenticate_rootadmin!, except: [:create]
  before_action :set_feed, only: [:show, :edit, :update, :destroy]
  layout 'adminpanel', only: [:edit, :new]

  # GET /feeds
  # GET /feeds.json
  def index
    @feeds = Feed.all
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
  end

  # GET /feeds/new
  def new
    @feed = Feed.new
  end

  # GET /feeds/1/edit
  def edit
  end

  # POST /feeds
  # POST /feeds.json
  def create
    @feed = Feed.new(feed_params)

    respond_to do |format|
      if @feed.save
        format.html { redirect_to :root, notice: "#{@feed.name} Спасибо за ваше сообщение. В самые ближайшие сроки администраор его прочитает и ответит вам "}
      else
        format.html { render 'welcome/feedback' }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feeds/1
  # PATCH/PUT /feeds/1.json
  def update
    respond_to do |format|
      if @feed.update(feed_rootadmin_params)
        format.html { redirect_to admin_panel_feedback_path, notice: 'Письмо успешно обновлено' }
        format.json { render :show, status: :ok, location: admin_panel_feedback_path }
      else
        format.html { render :edit }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.json
  def destroy
    if @feed.destroy
      render text: 'ok'
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_feed
    @feed = Feed.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def feed_params
    params.require(:feed).permit(:name, :email, :phone, :description)
  end

  def feed_rootadmin_params
    params.require(:feed).permit(:name, :email, :phone, :description, :moderation)
  end

end
