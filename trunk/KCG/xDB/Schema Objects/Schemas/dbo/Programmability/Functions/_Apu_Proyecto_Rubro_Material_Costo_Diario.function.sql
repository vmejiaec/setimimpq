create FUNCTION [dbo].[_Apu_Proyecto_Rubro_Material_Costo_Diario]
(
	@p_Apu_Proyecto_Rubro_Material_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
       @v_apu_proyecto_id varchar(17),
       @v_apu_Material_id varchar(17),
       @v_apu_proyecto_Material_id varchar(17),
       @v_costo_total numeric(17,4)
       
   exec @v_apu_proyecto_id 
       = dbo._apu_proyecto_rubro_Material_apu_proyecto_id @p_Apu_Proyecto_Rubro_Material_id

   exec @v_apu_Material_id 
       = dbo._apu_proyecto_rubro_Material_apu_Material_id @p_Apu_Proyecto_Rubro_Material_id

   exec @v_apu_proyecto_Material_id
       = dbo._Apu_Proyecto_Material_Id1 @v_apu_proyecto_id,  @v_apu_Material_id
   
   exec @v_costo_total 
       = dbo._Apu_Proyecto_Material_Costo_Total @v_apu_proyecto_Material_id          

   return  isnull(@v_Costo_Total,0)

END







