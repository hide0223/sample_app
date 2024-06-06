class ListsController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new
  end
  
  #以下のを追加
  def create
    list = List.new(list_params)
    list.save
    #redirect_to '/top' を削除して、以下のコードに変更
    #詳細画面にリダイレクト
    redirect_to list_path(list.id)
  end
  
  def index
    @lists = List.all
    # render :index
  end
  
  def show
    @list = List.find(params[:id])
  end 
  
  def edit
    @list = List.find(params[:id])
  end 
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)  
  end
  
  def destroy
    list = List.find(params[:id]) #データを1件取得
    list.destroy #データ（レコード）を削除
    redirect_to '/lists' #投稿一覧画面へリダイレクト
  end
  
  
  private
  #ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
  
end
