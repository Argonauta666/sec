class MaterialsController < ApplicationController
  breadcrumbs "Security Education" => routes.root_path,
              "Training Materials" => routes.materials_path

  def index
    @materials = Material.published.page(params[:page])
  end

  def show
    @material = Material.published.friendly.find(params[:id])
    og_object @material

    @topics = Topic.joins(:lessons).
      where("lessons.suggested_materials LIKE ?",
            "%#{ material_path(@material) }%")
  end
end
