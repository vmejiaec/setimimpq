CREATE FUNCTION [dbo].[_Apu_Oferta_Cuadrilla_Coeficiente_Categoria_1]
(
	@p_apu_oferta_id varchar(17),
    @p_apu_categoria_id varchar(17)
)
RETURNS numeric(17,3)

BEGIN
    
    declare 
       @v_trabajadores_mano_obra numeric (17,4),
       @v_trabajadores numeric(17,4),
       @v_total numeric (17,4),
		@totales varchar(17)
    

    exec @v_trabajadores_mano_obra =dbo._apu_oferta_cuadrilla_total_trabajadores1 @p_apu_oferta_id

    exec @v_trabajadores =  dbo._apu_oferta_cuadrilla_numero_trabajadores @p_apu_oferta_id, @p_apu_categoria_id

  if (isnull(@v_trabajadores_mano_obra,0) = 0) 
       set @v_total = 0
   else
	exec  @v_total = dbo.__division_tres_decimales @v_trabajadores, @v_trabajadores_mano_obra 

set @v_total=@v_total
    RETURN  @v_total
END











