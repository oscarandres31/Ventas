class SalesController < ApplicationController
  # before_action :set_sale, only: [:show, :edit, :update, :destroy, :add_item, :add_cliente, :set_sale ]#%>>
  before_action :set_sale, only: [:show, :edit, :add_item, :set_sale]
  def index
    @ventas = Sale.all
  end

  def show
  end

  def new
    @venta = Sale.create(total: 0.0)
   # current_user.sales = @venta
    current_user.save
    redirect_to edit_sale_path(@venta)
  end

  def edit
    @productos_venta = @venta.sale_details
  end

  def update
  end

  def destroy
    @venta.destroy
    respond_to do |format|
      format.html { redirect_to sale_path, notice: "Venta Eliminada Correctamente"}
      format.json { head :no_content }
    end
  end

  def add_item
    product = Product.find(params[:product_id])
    cantidad = params[:cantidad].nil? ? 1 : params[:cantidad].to_i
    importe_producto = product.price_sale * cantidad
    @sale_datail = @venta.sale_details.build(product: product, cantidad: cantidad)
    importe_antes_de_registro _ @venta.total
    importe_despues_registro = importe_antes_de_registro + importe_producto
    @venta.importe = importe_despues_registro

    existencia_antes_venta = product.amount

    result = {
      product_id: @sale_datail.product_id,
      precio_producto: product.price.to_f,
      nombre_prod: @sale_datail.product.try(:description),
      cantidad: @sale_detail.cantidad,
      importe_item: product.price * cantidad,
      importe_venta: importe_despues_registro
    }
    product.amount = existencia_antes_venta - cantidad

    respond_to do |format|
      if @venta.save && product.save
        format.json { render json: result }
      else
        format.json { render json: @venta.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def add_cliente
  end

  private

  def set_sale
    @venta = Sale.find(params[:id])
  end

end