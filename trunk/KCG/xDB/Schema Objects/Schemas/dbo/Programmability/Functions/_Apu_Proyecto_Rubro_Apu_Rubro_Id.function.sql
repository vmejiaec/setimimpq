CREATE FUNCTION [dbo].[_Apu_Proyecto_Rubro_Apu_Rubro_Id]
(
	@p_Apu_Proyecto_Rubro_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare 
      @v_apu_rubro_id varchar(17)
     
      select  @v_apu_rubro_id =
            (select apu_rubro_id
             from  apu_proyecto_rubro
             where id = @p_apu_proyecto_rubro_id)
      
    return  @v_apu_rubro_id

END












