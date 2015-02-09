CREATE FUNCTION [dbo].[_Apu_Proyecto_Cuadrilla_Coeficiente_ManoObra_1]
(
	@p_apu_proyecto_id varchar(17),
    @p_apu_mano_obra_id varchar(17)
)
RETURNS numeric(17,3)

BEGIN
    
    declare 
       @v_trabajadores_mano_obra numeric (17,4),
       @v_trabajadores numeric(17,4),
       @v_total numeric (17,4),
	   @totales varchar(17)
    
    exec @v_trabajadores_mano_obra =dbo._apu_proyecto_cuadrilla_total_trabajadores1 @p_apu_proyecto_id
--
    exec @v_trabajadores =  dbo._apu_proyecto_cuadrilla_numero_trabajadores1 @p_apu_proyecto_id, @p_apu_mano_obra_id

--
  if (isnull(@v_trabajadores,0) = 0) 
       set @v_total = 0
   else
	exec  @v_total = dbo.__division_tres_decimales @v_trabajadores, @v_trabajadores_mano_obra 
	
	set @v_total=@v_total

    RETURN  @v_total


END











