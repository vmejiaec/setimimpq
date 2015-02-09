create FUNCTION [dbo].[_Apu_Proyecto_Rubro_Mano_Obra_Apu_Proyecto_Rubro_Id]
(
	@p_apu_proyecto_rubro_mano_obra_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare 
      @v_apu_proyecto_rubro_id varchar(17)
     
      select  @v_apu_proyecto_rubro_id =
            (select apu_proyecto_rubro_id
             from  apu_proyecto_rubro_mano_obra
             where id = @p_apu_proyecto_rubro_mano_obra_id)
      
    return  @v_apu_proyecto_rubro_id

END










