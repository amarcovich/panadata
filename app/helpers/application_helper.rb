module ApplicationHelper

  def sortable(column, title = nil)  
    title ||= column.titleize  
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil  
    direction = (column == sort_column && sort_direction == "desc") ? "asc" : "desc"  
    link_to title, params.merge({:sort => column, :direction => direction}), {:class => css_class}  
  end  

  def export_licitations_path
    'http://panadata.s3.amazonaws.com/licitaciones.csv'
  end

  def export_sociedades_path
    'http://panadata.s3.amazonaws.com/sociedades.csv'
  end

  def export_brands_path
    'http://panadata.s3.amazonaws.com/marcas.csv'
  end

  def entidad_chart_data 
    Rails.cache.fetch("entidad_chart_data", :expires_in => 5.minutes) do
      (Licitation.sum(:precio, :group => :entidad)).map do |entidad,precio|
        [ entidad,precio.to_f ] 
      end
    end
  end
  
  def categoria_chart_data 
      (Licitation.where('compras.category_id IS NOT NULL').sum(:precio, :group => :category)).map do |category,precio|
        [ category.name,precio.to_f ]
      end
  end

  def proponente_chart_data(proveedor)
      (Licitation.select('extract(mon from fecha) as mon, extract(year from fecha) as year, sum(precio) as precio').group('1,2').order('2,1')).map do |l|
        [ "new Date(" + l.year.to_i.to_s + "," + l.mon.to_i.to_s + ", 1)" , "{v: " + l.precio.to_s + ", f: '$" + l.precio.to_s + "'}" ]
      end
  end

  def entidad_chart_data()
      (Licitation.select('extract(mon from fecha) as mon, extract(year from fecha) as year, sum(precio) as precio').group('1,2').order('2,1')).map do |l|
        [ "new Date(" + l.year.to_i.to_s + "," + l.mon.to_i.to_s + ", 1)" , "{v: " + l.precio.to_s + ", f: '$" + l.precio.to_s + "'}" ]
      end
  end
  def total_por_dia_data
    Rails.cache.fetch("total_por_dia_data", :expires_in => 5.minutes) do
      (Licitation.total_by_day(4.year.ago).sort_by{|x| x.date }).map do |compra_date|
        [ 
          compra_date.date,
          compra_date.total_price.to_f
        ] 
      end.unshift(['Fecha','Precio'])
    end
  end


end
