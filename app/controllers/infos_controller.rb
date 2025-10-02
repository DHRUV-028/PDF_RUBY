class InfosController < ApplicationController
  before_action :set_info, only: %i[ show edit update destroy ]

  # GET /infos or /infos.json
  def index
    @infos =Info.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name",
        template: "infos/index2",
        formats:[:html],
        layout:"pdf",
        user_style_sheet: "#{Rails.root}/app/assets/stylesheets/pdf.scss",
        locals:{
          infos: @infos
        },

        header: {html: {template: 'infos/header',
                        formats:[:html],
                        font_name: "Times New Roman",
                        font_size: 10,
                        left: "Company Name",
                        right: "Confidential",
                        spacing: 5,
                        line: true,      
                        content:  'HTML CONTENT ALREADY RENDERED'}}

      
    end
  end
    
  end




def show
  respond_to do |format|
    info = Info.find_by(id: params[:id])
    format.html
    format.pdf do
      
      render pdf: "file_name",
      template:"infos/info2",
      layout:"pdf",
      formats:[:html],
      locals:{
        info:info
      },
        header: {html: {template: 'infos/header',
                        formats:[:html],
                        font_name: "Times New Roman",
                        font_size: 10,
                        left: "Company Name",
                        right: "Confidential",
                        spacing: 5,
                        line: true,      
                        content:  'HTML CONTENT ALREADY RENDERED'}}
    end
  end
end





  # GET /infos/new
  def new
    @info = Info.new
  end

  # GET /infos/1/edit
  def edit
  end

  # POST /infos or /infos.json
  def create
    @info = Info.new(info_params)

    respond_to do |format|
      if @info.save
        format.html { redirect_to @info, notice: "Info was successfully created." }
        format.json { render :show, status: :created, location: @info }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /infos/1 or /infos/1.json
  def update
    respond_to do |format|
      if @info.update(info_params)
        format.html { redirect_to @info, notice: "Info was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @info }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /infos/1 or /infos/1.json
  def destroy
    @info.destroy!

    respond_to do |format|
      format.html { redirect_to infos_path, notice: "Info was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_info
      @info = Info.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def info_params
      params.expect(info: [ :orderNo, :firmName, :billNo, :amount, :location ])
    end
end
