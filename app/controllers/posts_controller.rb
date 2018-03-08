class PostsController < NetMate::Controller

  def index
    if @params['email']
      @posts = Post.find_by('email', @params['email'])
    else
      @posts = Post.all
    end
    0.upto(@posts.size.pred) do |index|
      @posts[index].content = @posts[index].content[0..490]
    end
    render 'index'
  end

  def create
    @params['posted_on'] = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
    h = {"'" => '&#39;', '"' => '&#34;'}
    @params['title'].gsub!(/['"]/,h)
    @params['content'].gsub!(/['"]/,h)
    Post.new(@params).save
    render 'create'
  end

  def details
    @post = Post.find(@params['id'])
    @comments = Comment.find_by('post_id', @post.id)
    @post.content.gsub!("\n", '<br />')

    0.upto(@comments.size.pred) do |index|
      @comments[index].content.gsub!("\n", '<br />')
   end
   
   render 'details'
 end

 def new
  @post = Post.new
  render 'new'
end

end