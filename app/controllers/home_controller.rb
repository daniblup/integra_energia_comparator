class HomeController < ApplicationController
  def index
    @productos = Product.all
  end
  
  def guardar_comparativa
    # Recoger datos del cliente
    email = params[:e_mail]
    postal_code = params[:codigo_postal]
    phone_number = params[:telefono]
    
    # Recoger datos del consumo
    productos = Array.new
    for i in 1..Product.count
      datos = Array.new(3)
      
      mi_param_cantidad="cantidad_"+i.to_s
      mi_param_horas_uso="horas_uso_"+i.to_s
      
      if params[mi_param_cantidad]!="" and params[mi_param_horas_uso]!=""
        
        datos[0]=i
        datos[1]=params[mi_param_cantidad]
        datos[2]=params[mi_param_horas_uso]
        
        productos << datos
      end
      
    end
    
    if productos.count !=0
      # Creamos nuevo cliente
      cliente = Client.new() 
      cliente.email=email
      cliente.postal_code=postal_code
      cliente.phone_number=phone_number
      
      # Calculamos todos los costes
      coste_actual = calcular_coste_actual(productos)
      coste_actual_equiv = calcular_coste_actual_equiv(productos)
      coste_instalacion = calcular_coste_instalacion(productos)
      
      # Calculamos el tiempo en meses de la amortización de la instalación
      meses_amortizacion = calcular_meses_amortizacion(coste_instalacion, coste_actual, coste_actual_equiv)
      
      p "coste actual: "+coste_actual.round(2).to_s
      p "coste coste actual equiv: "+coste_actual_equiv.round(2).to_s
      p "coste instalacion: "+coste_instalacion.round(2).to_s
      p "meses amortizacion: "+meses_amortizacion.round(0).to_s
      p "--------------------------------------------------------"
      
      # Creo comparativa
      comparativa = Comparative.new()
      comparativa.current_cost=coste_actual.round(2)
      comparativa.integra_cost=coste_actual_equiv.round(2)
      comparativa.installation_cost=coste_instalacion.round(2)
      comparativa.amortization_term=meses_amortizacion.round(0)
      
      comparativa.save
      
      # Asocio la comparativa al cliente
      cliente.comparatives << comparativa
      
      cliente.save
      
      # Asocio los productos a la comparativa
      productos.each do |producto|
        comparativa.products << Product.find(producto[0])
        comparativa.save
        comparativa_producto = ComparativesProduct.where(product_id: producto[0], comparative_id: comparativa.id).first
        comparativa_producto.amount = producto[1]
        comparativa_producto.hours_use = producto[2]
        comparativa_producto.save
      end
      
    end
    
    @comparativa = comparativa
    
  end
  
  def calcular_coste_actual(productos)
    coste_actual = 0
    
    productos.each do |producto|
      mi_producto = Product.find(producto[0])
      
      coste_producto_ano = (producto[1].to_f * producto[2].to_f * mi_producto.consumption_w * 5 * 4 * 12)/1000 * 0.098
      
      coste_actual+=coste_producto_ano
    end
    
    return coste_actual
  end
  
  def calcular_coste_actual_equiv(productos)
    coste_actual_equiv = 0
    
    productos.each do |producto|
      mi_producto = Product.find(producto[0])
      
      coste_producto_equiv_ano = (producto[1].to_f * producto[2].to_f * mi_producto.consumption_w_equiv * 5 * 4 * 12)/1000 * 0.098
      
      coste_actual_equiv+=coste_producto_equiv_ano
    end
    
    return coste_actual_equiv
    
  end
  
  def calcular_coste_instalacion(productos)
    precio_pedido=0
    
    productos.each do |producto|
      mi_producto = Product.find(producto[0])
      
      coste_producto = producto[1].to_f * mi_producto.price_equiv
      
      precio_pedido+=coste_producto
    end
    
    if precio_pedido < 60
      return 60
    else
      return precio_pedido + precio_pedido*0.25
    end
  end
  
  def calcular_meses_amortizacion (coste_instalacion, coste_actual, coste_actual_equiv)
    meses_amortizacion=coste_instalacion/((coste_actual/12)-(coste_actual_equiv/12))
    return meses_amortizacion
  end
  
end
