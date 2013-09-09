class MainController < ApplicationController
  
  before_filter except: ["login", "login_post", "logout", "index"] do 
    if session[:user_id] != nil
      @user = Author.where(id: session[:user_id]).first
    else
      flash[:error] = "You must be logged in to see that page."
      redirect_to "/login" and return
    end
  end

  def login
    render :login and return
  end

  def login_post
    @username = params[:username]
    @password = params[:password]

    user = Author.where(username: @username).first

    if user != @username 
      flash[:error] = "Unknown username"
    elsif user.authenticate(@password) == false
      flash[:error] = "Wrong password"
    else
      session[:user_id] = user.id
      redirect "/index"
    end
    render :login and return
  end

  def index
    #@user = Author.find(session[:user_id])
    @blog_posts = BlogPost.order("written_at desc").all

    render :index and return
  end

  def edit
    @user = Author.find(session[:user_id])

    id = params[:id]
    @post = BlogPost.find(id)
    @title = "Edit post ##{@post.id}"
    render :edit and return
  end

  def edit_post
    id                = params[:id]
    @post             = BlogPost.find(id)
    @post.written_at  = params[:written_at]
    @post.body        = params[:body]
    @post.author_name = params[:author_id]

    if @post.save == true
      redirect_to "/" and return
    else
      @title = "Edit post ##{@post.id}"
      render :edit and return
    end
  end

  def new
    @user = Author.find(session[:user_id])
    @post = BlogPost.new
    @title = "Write new post"
    render :new and return
  end

  def new_post
    @post             = BlogPost.new
    @post.written_at  = params[:written_at]
    @post.body        = params[:body]
    @post.author_name = params[:author_id]

    if @post.save == true
      redirect_to "/" and return
    else
      @title = "Write new post"
      render :new and return
    end
  end

  def logout
    session.clear
    redirect_to "/login" and return
  end
end
