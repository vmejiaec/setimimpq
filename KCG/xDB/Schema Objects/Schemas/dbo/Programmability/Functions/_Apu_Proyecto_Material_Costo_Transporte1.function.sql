
CREATE FUNCTION [dbo].[_Apu_Proyecto_Material_Costo_Transporte1]
(
	@p_apu_proyecto_id varchar(17),
    @p_Apu_Material_Id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_Costo_Transporte numeric(17,4)
              

	select  @v_Costo_Transporte = 
            (select costo_transporte
             from  apu_proyecto_material
             where Apu_Proyecto_Id = @p_Apu_Proyecto_Id
             and Apu_Material_Id = @p_Apu_Material_Id)

    RETURN  @v_Costo_Transporte

END



