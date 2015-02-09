CREATE FUNCTION [dbo].[_Apu_Proyecto_Transporte_Costo_Total_Indice]
(
	@p_apu_proyecto_id varchar(17),
    @p_apu_indice_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
            @v_total numeric(17,4)

	select  @v_total = 
     (
		select
		   dbo._Apu_proyecto_Transporte_Indice_Costo_x_Porcentaje (Id)
		from apu_proyecto_transporte_indice
		where apu_indice_id = @p_apu_indice_id
        and apu_proyecto_id = @p_apu_proyecto_id
    )

    RETURN  isnull (@v_total,0)

END










