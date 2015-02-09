




CREATE FUNCTION [dbo].[_Apu_Proyecto_Rubro_Material_Costo_Diario_X_Cantidad]
(
	@p_apu_proyecto_rubro_Material_id varchar(17),
    @p_Apu_Proyecto_Id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
   declare 
      @v_Resultado numeric (17,4)

      set @v_Resultado = (
          Select dbo.__Multiplicar_cuatro_decimales_2(
               Cantidad, dbo._apu_proyecto_Material_Costo_Total1(@p_Apu_Proyecto_Id, Apu_Material_Id))
          From Apu_Proyecto_Rubro_Material
          Where Id = @p_apu_proyecto_rubro_Material_id)

   RETURN  isnull(@v_resultado,0)

END














