CREATE FUNCTION [dbo].[_Apu_Oferta_Costo_Transporte]
(
	@p_Apu_Oferta_Id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_costo numeric(17,4)

     select  @v_costo = 
             (select sum(dbo._Apu_Oferta_Rubro_Transporte_Costo_x_Cantidad (id))
              from  apu_Oferta_Rubro_Material 
              where dbo._apu_oferta_rubro_apu_Oferta_id (apu_oferta_rubro_Id)
                    = @p_apu_Oferta_id)
      
    return  isnull(@v_costo,0)

END











