CREATE FUNCTION [dbo].[_Apu_Proyecto_Rubro_Apu_Proyecto_Id]
(
	@p_Apu_Proyecto_Rubro_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare 
      @v_apu_proyecto_id varchar(17)
     
      select  @v_apu_proyecto_id =
            (select apu_proyecto_id
             from  apu_proyecto_rubro
             where id = @p_apu_proyecto_rubro_id)
      
    return  @v_apu_proyecto_id

END












