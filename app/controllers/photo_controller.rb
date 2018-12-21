class PhotoController < ApplicationController
  def index
     @posts = Post.all.order("created_at DESC")
  end

  def store
      # upload image to cloudinary
      @value = Cloudinary::Uploader.upload(params[:image], :resource_type => "image")
      
      # create a new post object and save to db
      @post = Post.new({:link => @value['secure_url'], :caption => params[:caption], :likes => params[:likes]})
      
      if @post.save
        # broadcasting posts using pusher
          Pusher.trigger('posts-channel','new-post', {
            link: @post.link,
            caption: @post.caption, 
            likes: @post.likes
          })
      end
      
      # @TODO - trigger an event with Pusher
      
      redirect_to('/')
  end
  
  def destroy
    Cloudinary::Uploader.destroy(params[:target])
    Post.where(link: params[:target]).destroy_all

    flash[:success] = "Photo Deleted"
    redirect_to('/')
  end
  
  
end
