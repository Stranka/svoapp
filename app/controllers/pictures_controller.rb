class PicturesController < ApplicationController
  # GET /articles
  # GET /articles.xml
  def index

    params[:picture] = ''
    flash[:notice] = ''
    params[:type] = ''

  end

  def create
    if params[:image_file] != nil
      pic = params[:image_file]
      @type = pic.content_type.split("/")
      @type = @type[0]

      if pic.size > @picture_size
        params[:picture] = ''
        params[:type] = ''
        flash[:notice] = t('picture to big')
      else
        complete_path = Rails.root.to_s + '/public/images/' + pic.original_filename
        FileUtils.copy(pic.tempfile.path, complete_path)
        params[:picture] = pic.original_filename
        params[:type] = @type
        flash[:notice] = t('file uploaded')
      end
    end
    render :action => 'index'
  end

end

