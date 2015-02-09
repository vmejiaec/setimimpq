CREATE FUNCTION [dbo].[_Apu_Oferta_Categoria_Costo_Hora1]
(
	@p_apu_oferta_id varchar(17),
    @p_apu_categoria_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_costo_diario numeric(17,4),
            @v_costo_hora numeric (17,4),
            @v_apu_oferta_categoria_id varchar(17),
            @v_numero_horas int

    set @v_numero_horas = 8
    Select @v_apu_oferta_categoria_id =
            (select id
             from apu_oferta_categoria
             where apu_oferta_id = @p_apu_oferta_id
             and apu_categoria_id = @p_apu_categoria_id)

	exec  @v_costo_diario = dbo._Apu_Oferta_Categoria_Costo_Diario @v_apu_oferta_categoria_id
    
    exec @v_costo_hora = dbo.__division_cuatro_decimales @v_costo_diario, @v_numero_horas

    return  isnull(@v_costo_hora,0)

END



















