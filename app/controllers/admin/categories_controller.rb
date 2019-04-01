class Admin::CategoriesController < Admin::BaseController
  before_action :load_category, except: [:index, :new, :create]

  def index
    @category = Category.paginate page: params[:page], per_page: 25
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Tạo hãng thành công"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @category.update_attributes category_params
      flash[:success] = "cập nhật thành công"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:success] = "Xóa thành công"
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit :name
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = "Chuyên mục không tồn tại"
    redirect_to admin_categories_path
  end
end
