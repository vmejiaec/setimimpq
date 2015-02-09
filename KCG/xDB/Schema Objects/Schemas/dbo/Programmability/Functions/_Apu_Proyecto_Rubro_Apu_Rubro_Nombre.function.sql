create FUNCTION [dbo].[_Apu_Proyecto_Rubro_Apu_Rubro_Nombre]
(
	@p_Apu_Rubro_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare 
      @v_Apu_Rubro_Nombre varchar(500)
     
      select  @v_Apu_Rubro_Nombre =
            (select nombre
             from  apu_rubro
             where id = @p_apu_rubro_id)
      
    return  @v_Apu_Rubro_Nombre

END













