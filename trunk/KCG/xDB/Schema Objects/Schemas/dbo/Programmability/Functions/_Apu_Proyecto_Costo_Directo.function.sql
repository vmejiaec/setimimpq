

CREATE FUNCTION [dbo].[_Apu_Proyecto_Costo_Directo]
(
	@p_apu_proyecto_id varchar(17)
)
RETURNS numeric(17,2)
BEGIN
    
    declare 
      @v_apu_proyecto_costo_material   numeric(17,4),
      @v_apu_proyecto_costo_mano_obra  numeric(17,4),
      @v_apu_proyecto_costo_equipo     numeric(17,4),
      @v_apu_proyecto_costo_transporte numeric(17,4),
      @v_total numeric (17,4)
   
  Select @v_Total =
   (Select isnull(sum(dbo._Apu_Proyecto_Rubro_Costo_Total(Id)),0)
    From Apu_Proyecto_Rubro
    Where Apu_Proyecto_Id = @p_apu_proyecto_id)

   
   return isnull( @v_total,0)

END




