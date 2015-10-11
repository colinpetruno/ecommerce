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
      object.images.build(params)
    else
      object.send("build_#{model_type.underscore}".to_sym, params)
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

  def model_type
    params[:photo_type] || image_params[:photo_type] || "image"
  end

  def id_parameter
    "#{model_name}_id".to_sym
  end

  def image_params
    params.
      require(:image).
      permit(:resource, :product_id, :category_id, :photo_type)
  end
end
