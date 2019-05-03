class Admin::ProductsController < Admin::BaseController
  before_action :load_product, except: [:index, :new, :create]
  def index
    @products = Product.all
    @products = @products.search_name params[:search_name] if params[:search_name].present?
    @categories_for_search = Category.pluck :name, :id
    @products = @products.search_product_category params[:category_id] if params[:category_id].present?
    @products = @products.paginate page: params[:page], per_page: 25
  end

  def new
    @product = Product.new
    @show_categories = Category.pluck :name, :id
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = "Thêm sản phẩm mới thành công"
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @product.update_attributes product_params
      flash[:success] = "Cập nhật thành công"
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:success] = "Đã xóa hãng thành công"
    redirect_to admin_products_path
  end

  private
  def product_params
    params.require(:product).permit :name, :price, :image, :description,
      :sale_price, :status, category_ids: []
  end

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:danger]="Sản phẩm không tồn tại"
    redirect_to admin_products_path
  end
end
