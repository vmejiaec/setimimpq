CREATE FUNCTION [dbo].[_Apu_Proyecto_Costo_Metro_Cuadrado]
(
	@p_apu_proyecto_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_apu_proyecto_costo_total numeric(17,4),
      @v_apu_proyecto_area numeric(17,4),
      @v_total numeric (17,4)

      exec @v_apu_proyecto_costo_total = 
             dbo._apu_proyecto_costo_total @p_apu_proyecto_id

      exec @v_apu_proyecto_area = 
             dbo._apu_proyecto_area @p_apu_proyecto_id
      
      if @v_apu_proyecto_area = 0
         set @v_total = 0
      else
         exec @v_total = dbo.__division_cuatro_decimales
                            @v_apu_proyecto_costo_total,
							@v_apu_proyecto_area
			
--		set @v_total= @v_apu_proyecto_costo_total
    RETURN  @v_total

END





















