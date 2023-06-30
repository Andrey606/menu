class PagesController < ApplicationController
  def home
    @pdf_files = PdfFile.where(locale: locale.to_s)

    render :home
  end
end
