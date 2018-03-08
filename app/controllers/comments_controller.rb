class CommentsController < NetMate::Controller

  def create
    @params['posted_on'] = DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
    h = {"'" => '&#39;', '"' => '&#34;'}
    @params['content'].gsub!(/['"]/,h)
    Comment.new(@params).save
    render 'create'
  end

end
