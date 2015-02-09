CREATE FUNCTION [dbo].[_Apu_Oferta_Rubro_Costo_Equipo]
(
	@p_Apu_Oferta_Rubro_Id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_costo numeric(17,4)

     select  @v_costo = 
             (select sum(dbo._Apu_Oferta_Rubro_Equipo_Costo (id))
              from  apu_Oferta_rubro_equipo 
              where apu_Oferta_rubro_id = @p_apu_Oferta_Rubro_id)
      
    return  isnull(@v_costo,0)

END














