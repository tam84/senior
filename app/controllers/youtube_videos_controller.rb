class YoutubeVideosController < ApplicationController
  
  def new
    @youtube_video = YoutubeVideo.new
  end

  def create
    @youtube_video = YoutubeVideo.new(youtube_video_params)
    if @youtube_video.save
      flash[:success] = "Video postado com sucesso"
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = "Não foi possível fazer o post. Por favor tente novamente"
      redirect_back(fallback_location: root_path)
    end

  end

  def index

  end

  private

  def youtube_video_params
    params.require(:youtube_video).permit(:title, :url, :videoable_id, :videoable_type)    
  end


end
