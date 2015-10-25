class Admin::CouponsController < Admin::BaseController
  def index
    @coupons = Coupon.all
  end

  def new
    @coupon = Coupon.new
  end

  def edit
    @coupon = Coupon.find(params[:id])
  end

  def create
    @coupon = Coupon.new(coupon_params)

    if @coupon.save
      redirect_to edit_admin_coupon_path(@coupon)
    else
      render :new
    end
  end

  def update
    @coupon = Coupon.find(params[:id])

    if @coupon.update(coupon_params)
      redirect_to edit_admin_coupon_path(@coupon)
    else
      render :edit
    end
  end

  def destroy
    # should probaly hide
  end

  private

  def coupon_params
    params.require(:coupon).permit(:name, :code, :inventory, :begins, :expires)
  end
end
