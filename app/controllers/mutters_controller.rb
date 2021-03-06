class MuttersController < ApplicationController
  def index
  end
  
  def new
    if params[:back]
      @mutter = Content.new(mutter_params)
    else
      @mutter = Content.new
    end
  end
  
  def create
    @mutter = Content.new(mutter_params)
    if @mutter.save
      redirect_to new_mutter_path, notice:"ブログを作成しました！"
    else
      render 'confirm'
    end
  end
  
  def list
    @mutters = Content.all
  end
  
  def edit
    if params[:back]
      @mutter = Content.new(mutter_params)
    else
      @mutter = Content.find(params[:id])
    end
  end
  
  def confirm
    @mutter = Content.new(mutter_params)
    if @mutter.valid?
      render 'confirm'
    end
  end
  
  def edit_confirm
    @mutter = Content.new(mutter_params)
     if @mutter.valid?
      render 'confirm'
    end
  end
  
  def update
    @mutter = Content.find(params[:id])
    if @mutter.update(mutter_params)
       redirect_to list_mutters_path, notice:"編集しました！"
     else
       render 'edit'
    end
  end
  
  def destroy
    @mutter = Content.find(params[:id])
    @mutter.destroy
    redirect_to list_mutters_path, notice:"削除しました！"
  end

  private
  
  def mutter_params
    params.require(:content).permit(:content)
  end
end