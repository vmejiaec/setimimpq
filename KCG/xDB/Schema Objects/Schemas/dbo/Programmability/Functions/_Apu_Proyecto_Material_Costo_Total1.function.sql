
-- Esta funcion devuelve el costo uniatario del material que reciba 
-- como parametro
CREATE FUNCTION [dbo].[_Apu_Proyecto_Material_Costo_Total1]
(
	@p_Apu_Proyecto_Id varchar(17),
    @p_Apu_Material_Id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_Costo_Total numeric(17,4)
              

	select  @v_Costo_Total = 
            (select dbo.__suma_cuatro_decimales_2(Costo_Parcial,Costo_Otros)
             from  apu_proyecto_material
             where Apu_Proyecto_Id = @p_Apu_Proyecto_Id
             and  Apu_Material_Id = @p_Apu_Material_Id)

    RETURN  @v_Costo_Total

END






