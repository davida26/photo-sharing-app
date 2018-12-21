class PhotoController < ApplicationController
  def index
     @posts = Post.all.order("created_at DESC")
  end

  def store
      # upload image to cloudinary
      @value = Cloudinary::Uploader.upload(params[:image])
      
      # create a new post object and save to db
      @post = Post.new({:link => @value['secure_url'], :caption => params[:caption]})
      @post.save
      
      # @TODO - trigger an event with Pusher
      
      redirect_to('/')
  end
end
