﻿CREATE FUNCTION [dbo].[_Apu_Proyecto_Categoria_Costo_Hora]
(
	@p_apu_proyecto_categoria_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_costo_diario numeric(17,4),
            @v_costo_hora numeric (17,4),
            @v_numero_horas int

    set @v_numero_horas = 8
	exec  @v_costo_diario = dbo._Apu_Proyecto_Categoria_Costo_Diario @p_apu_proyecto_categoria_id
    
    exec @v_costo_hora = dbo.__division_cuatro_decimales @v_costo_diario, @v_numero_horas

    return  isnull(@v_costo_hora,0)

END

















