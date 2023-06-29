module Admin
  class PdfFilesController < ApplicationController
    before_action :require_admin

    def index
      @pdf_files = PdfFile.all
    end

    def new
      @pdf_file = PdfFile.new
    end

    def create
      @pdf_file = PdfFile.new(pdf_file_params)
      if @pdf_file.save
        redirect_to admin_pdf_files_path, notice: "PDF file uploaded successfully."
      else
        render :new
      end
    end

    def open_pdf
      pdf_file = PdfFile.find(params[:id])
      redirect_to pdf_file.file_url
    end
  

    def destroy
      @pdf_file = PdfFile.find(params[:id])
      @pdf_file.destroy
      redirect_to admin_pdf_files_path, notice: "PDF file deleted successfully."
    end

    private

    def pdf_file_params
      params.require(:pdf_file).permit(:name, :file, :locale)
    end

    def require_admin
      redirect_to admin_login_path unless current_user && current_user.admin?
    end
  end
end
