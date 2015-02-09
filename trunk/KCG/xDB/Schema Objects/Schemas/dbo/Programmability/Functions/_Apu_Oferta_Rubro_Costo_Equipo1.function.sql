CREATE FUNCTION [dbo].[_Apu_Oferta_Rubro_Costo_Equipo1]
(
	@p_Apu_Oferta_Id varchar(17),
    @P_Apu_Equipo_Id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
      @v_costo numeric(17,4)

     select  @v_costo = 
             (select sum(dbo._apu_Oferta_rubro_Equipo_costo_x_cantidad (id))
              from  apu_Oferta_rubro_Equipo 
              where dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_Rubro_Id) 
                    = @p_apu_Oferta_id
              and apu_Equipo_id = @p_apu_Equipo_id)
      
    return  isnull(@v_costo,0)

END












