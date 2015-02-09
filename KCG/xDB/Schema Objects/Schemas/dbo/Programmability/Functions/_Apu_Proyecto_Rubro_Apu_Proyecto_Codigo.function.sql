CREATE FUNCTION [dbo].[_Apu_Proyecto_Rubro_Apu_Proyecto_Codigo]
(
	@p_Apu_Proyecto_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare 
      @v_Apu_Proyecto_Codigo varchar(200)
     
      select  @v_Apu_Proyecto_Codigo =
            (select codigo
             from  apu_proyecto
             where id = @p_apu_proyecto_id)
      
    return  @v_Apu_Proyecto_Codigo

END













