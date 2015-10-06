class Admin::ImagesController < Admin::BaseController
  def new
    @object = model.find(params[id_parameter])
    @image = build_image(@object)
  end

  def create
    @object = model.find(params[id_parameter])
    @image = build_image(@object, image_params)

    if @image.save
      redirect_to edit_polymorphic_path([:admin, @object])
    else
      render :new
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    redirect_to edit_polymorphic_path([:admin, @image.send(model_name.to_sym)])
  end

  private

  def build_image(object, params = {})
    if object.respond_to?(:images)
      @object.images.build(params)
    else
      @object.build_image(params)
    end
  end

  def model
    @model ||= [Category, Product].detect do |c|
      params["#{c.name.underscore}_id"]
    end
  end

  def model_name
    model.name.underscore
  end

  def id_parameter
    "#{model_name}_id".to_sym
  end

  def image_params
    params.require(:image).permit(:resource, :product_id, :category_id)
  end
end
