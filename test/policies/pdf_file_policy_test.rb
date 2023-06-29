require 'test_helper'

class PdfFilePolicyTest < ActiveSupport::TestCase
  def index?
    user.super_user?
  end
end
