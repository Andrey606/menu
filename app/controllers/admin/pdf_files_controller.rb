module Admin
  class PdfFilesController < ApplicationController
    before_action :require_admin, only: [:index, :new, :create, :destroy]

    def index
      pdfs = PdfFile.all

      @pdf_objects = []
      pdfs.each do |pdf|
        object_key = "#{pdf.locale.to_s}/#{pdf.name}.pdf"
        @pdf_objects << {file_url: open_pdf_path(pdf), name: object_key, locale: pdf.locale.to_s, model: pdf}
      end
    end

    def new
      @pdf_file = PdfFile.new
    end

    def create
      @pdf_file = PdfFile.new(name: pdf_file_params[:name], locale: pdf_file_params[:locale])

      if @pdf_file.valid? && !pdf_file_params[:file].nil?
        s3 = Aws::S3::Resource.new
        bucket = s3.bucket(Rails.application.credentials.aws.bucket_name)
        object_key = "#{pdf_file_params[:locale]}/#{pdf_file_params[:name]}.pdf"
        object = bucket.object(object_key)

        file = pdf_file_params[:file]
        object.put(body: File.open(file, 'rb'))

        if bucket.object(object_key).exists?
          @pdf_file.save!

          redirect_to admin_pdf_files_path, notice: "PDF file uploaded successfully."
        else
          render :new
        end
      else
        render :new
      end
    end

    def open_pdf
      pdf = PdfFile.find(params[:id])

      s3 = Aws::S3::Resource.new
      
      bucket = s3.bucket(Rails.application.credentials.aws.bucket_name)
      object_key = "#{pdf.locale.to_s}/#{pdf.name}.pdf"
      obj = bucket.object(object_key)

      if obj.exists?
        temp_file = Tempfile.new('downloaded_pdf')
        
        obj.download_file(temp_file.path)

        response.headers['Content-Type'] = 'application/pdf'
        send_file(temp_file.path, disposition: 'inline', filename: 'document.pdf')
      end
    end
  

    def destroy
      pdf = PdfFile.find(params[:id])
      pdf.destroy

      object_key = "#{pdf.locale.to_s}/#{pdf.name}.pdf"
      s3 = Aws::S3::Client.new
      s3.delete_object(bucket: Rails.application.credentials.aws.bucket_name, key: object_key)

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
