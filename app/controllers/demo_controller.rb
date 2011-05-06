class DemoController < ApplicationController

  layout 'admin'
   before_filter :confirm_logged_in
  def index
    # render('hello')
    #redirect_to(:action => 'other_hello')
  end

  def hello
    @array = [1,2,3,4,5]
    @id = params[:id].to_i
    @page = params[:page].to_i
  end
  
  def other_hello
    render(:text => 'Hello Everyone!')
  end
  
  def javascript
  end
  
  def text_helpers
  end
  
end
