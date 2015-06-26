class PdfsController < ApplicationController
  layout 'pdf'
  
  def ejemplo
    respond_to do |format|
      format.pdf do
        render pdf: "grijando"   
      end
    end
  end
end