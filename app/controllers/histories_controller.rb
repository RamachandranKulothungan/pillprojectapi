class HistoriesController < ApplicationController
  before_action :set_history, only: [:show, :edit, :update, :destroy]

  # GET /histories
  # GET /histories.json
  def index
    @histories = History.all
  end

  # GET /histories/1
  # GET /histories/1.json
  def show
  end

  # GET /histories/new
  def new
    @history = History.new
  end

  # GET /histories/1/edit
  def edit
  end

  #GET "histories/user/:user_id"
  def get_for_user
    user_id = params[:user_id]

    # # for today
    # @medical_histories = MedicalHistory
          # .where(user_id: user_id, dependent_id: nil)
          # .where("? BETWEEN startdate AND enddate", DateTime.now.to_date)
          # .order(:startdate, :asc)

    # # if no records for today, then get for tomorrow
    # if @medical_histories.size == 0 
    #   @medical_histories = MedicalHistory
    #   .where(user_id: user_id, dependent_id: nil)
    #   .where("? BETWEEN startdate AND enddate",  DateTime.now.next_day.to_date)
    #   .order(:startdate, :asc) 
    # end
    @histories = History.where(user_id: user_id)
          .order(:start_date, :asc)
          
    render json: @histories
  end

  #GET "histories/user/:user_id/current"
  def get_for_user_current
    user_id = params[:user_id]

    # for today
    @histories = History
           .where(user_id: user_id)
           .where("? BETWEEN start_date AND end_date", DateTime.now.to_date)
           .order(:start_date, :asc)

    # if no records for today, then get for tomorrow
    if @histories.size == 0 
      @histories = History
      .where(user_id: user_id)
      .where("? BETWEEN start_date AND end_date",  DateTime.now.next_day.to_date)
      .order(:start_date, :asc) 
    end 
    render json: @histories
  end


  # POST /histories
  # POST /histories.json
  def create
    @history = History.new(history_params)

    respond_to do |format|
      if @history.save
        format.html { redirect_to @history, notice: 'History was successfully created.' }
        format.json { render :show, status: :created, location: @history }
      else
        format.html { render :new }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /histories/1
  # PATCH/PUT /histories/1.json
  def update
    respond_to do |format|
      if @history.update(history_params)
        format.html { redirect_to @history, notice: 'History was successfully updated.' }
        format.json { render :show, status: :ok, location: @history }
      else
        format.html { render :edit }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /histories/1
  # DELETE /histories/1.json
  def destroy
    @history.destroy
    respond_to do |format|
      format.html { redirect_to histories_url, notice: 'History was successfully destroyed.' }
      format.json {render json: {'record': "Deleted"},
                    status: :ok}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history
      @history = History.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def history_params
      params.require(:history).permit(:illness, :doctor, :medicines, :start_date, :end_date, :dosage_amount, :dosage_frequency, :dosage_time, :notification, :user_id,:dependent_id)
    end
end
