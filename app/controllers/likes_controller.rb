class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    # buildメソッドとは
    # 親モデルに属する子モデルのインスタンスを新たに生成したい場合に使うメソッド
    # (親モデルと子モデルはアソシエーション設定必須)
    # 外部キーに値が入った状態でインスタンスが生成できる
    @like = current_user.likes.build(like_params)
    @post = @like.post
    if @like.save
      respond_to :js
    end
  end

  def destroy
    @like = Like.find_by(id: params[:id])
    @post = @like.post
    if @like.destroy
      respond_to :js
    end
  end

  private
    def like_params
      params.permit(:post_id)
    end
end
