CREATE FUNCTION [dbo].[_Apu_Proyecto_Rubro_Apu_Proyecto_Nombre]
(
	@p_Apu_Proyecto_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare 
      @v_Apu_Proyecto_Nombre varchar(500)
     
      select  @v_Apu_Proyecto_Nombre =
            (select nombre
             from  apu_proyecto
             where id = @p_apu_proyecto_id)
      
    return  @v_Apu_Proyecto_Nombre

END












