class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end

  def new
    if params[:back]
      @contact = Contact.new(contact_params)
    else
      @contact = Contact.new
    end
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      #記入画面へ遷移して”お問い合わせありがとうございました”とメッセージを表示する。
      redirect_to root_path, flash: {notice: "お問い合わせありがとうございました。" }
      #redirect_to action: :new, notice: "お問い合わせありがとうございました。"
    else
      #入力フォームを再描画します。
      render 'new'
    end
  end

  def confirm
    @contact = Contact.new(contact_params)
    render :new if @contact.invalid?
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
