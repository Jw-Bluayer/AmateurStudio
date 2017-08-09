class PostsController < ApplicationController
  before_action :set_user
  before_action :authenticate_user! 
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = @user.present? ? @user.posts.all : Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = @user.present? ? @user.posts.new : Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @user.present? ? @user.posts.new(post_params) :Post.new(post_params)

    respond_to do |format|
      if @post.save    
        format.html { redirect_to (@user.present? ? [@post.user, @post] : @post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  def create1
    @post = @user.present? ? @user.posts.new(post_params) :Post.new(post_params)

    
      if @post.save
        redirect_to (@user.present? ? [@post.user, @post] : @post), notice: 'Post was successfully created.' 
      
      else
        render :new 
      
      end
    
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to (@user.present? ? [@post.user, @post] : @post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to (@user.present? ? user_posts_url(@user) : posts_url), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_user
      @user = User.find(params[:user_id]) if params[:user_id].present?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      if @user.present?
        @post = @user.posts.find(params[:id])
      else
        @post = Post.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params[:post][:user_id] = current_user.id 
      params.require(:post).permit(:title, :content, :user_id, :image)
    end
end
