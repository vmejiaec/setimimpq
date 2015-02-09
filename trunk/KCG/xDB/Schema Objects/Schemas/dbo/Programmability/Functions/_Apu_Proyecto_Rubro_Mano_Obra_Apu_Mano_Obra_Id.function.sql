create FUNCTION [dbo].[_Apu_Proyecto_Rubro_Mano_Obra_Apu_Mano_Obra_Id]
(
	@p_apu_proyecto_rubro_mano_obra_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare 
      @v_apu_mano_obra_id varchar(17)
     
      select  @v_apu_mano_obra_id =
            (select apu_mano_obra_id
             from  apu_proyecto_rubro_mano_obra
             where id = @p_apu_proyecto_rubro_mano_obra_id)
      
    RETURN  @v_apu_mano_obra_id

END












