create FUNCTION [dbo].[_Apu_Proyecto_Rubro_Material_Apu_Material_Id]
(
	@p_apu_proyecto_rubro_Material_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare 
      @v_apu_material_id varchar(17)
     
      select  @v_apu_material_id =
            (select apu_material_id
             from  apu_proyecto_rubro_Material
             where id = @p_apu_proyecto_rubro_Material_id)
      
    RETURN  @v_apu_material_id

END












