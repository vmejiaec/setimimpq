create FUNCTION [dbo].[_Apu_Proyecto_Rubro_Rendimiento_Mano_Obra]
(
	@p_apu_proyecto_rubro_id varchar(17)
)
RETURNS numeric(17,6)
BEGIN
    
    declare @v_rendimiento_mano_obra numeric(17,6)

	select  @v_rendimiento_mano_obra = 
            (select rendimiento_mano_obra 
             from  apu_proyecto_rubro
             where id = @p_apu_proyecto_rubro_id)

    RETURN  @v_rendimiento_mano_obra

END














