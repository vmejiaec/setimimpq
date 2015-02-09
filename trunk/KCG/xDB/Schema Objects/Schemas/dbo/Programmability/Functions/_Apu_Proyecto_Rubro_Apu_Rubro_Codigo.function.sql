create FUNCTION [dbo].[_Apu_Proyecto_Rubro_Apu_Rubro_Codigo]
(
	@p_Apu_Rubro_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare 
      @v_Apu_Rubro_Codigo varchar(200)
     
      select  @v_Apu_Rubro_Codigo =
            (select codigo
             from  apu_rubro
             where id = @p_apu_rubro_id)
      
    return  @v_Apu_Rubro_Codigo

END













