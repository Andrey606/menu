class PagesController < ApplicationController
  def home
    @pdf_files = PdfFile.all.where(locale: locale)
  end
end
