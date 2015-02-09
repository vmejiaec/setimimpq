CREATE FUNCTION [dbo].[_Apu_Oferta_Cuadrilla_Coeficiente_Categoria]
(
	@p_apu_Oferta_id varchar(17),
    @p_apu_categoria_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
       @v_costo_categoria numeric (17,4),
       @v_costo numeric(17,4),
       @v_total numeric (17,4)
    

    exec @v_costo_categoria
         = dbo._Apu_Oferta_Mano_Obra_Costo_Categoria  @p_apu_Oferta_id , @p_apu_categoria_id

    exec @v_costo = dbo._apu_Oferta_costo_mano_obra_cuadrilla @p_apu_Oferta_id

    if (isnull(@v_costo,0) = 0)
        set @v_total = 0
    else    
	    exec  @v_total = dbo.__division_cuatro_decimales @v_costo_categoria , @v_costo
    
    RETURN  isnull(@v_total,0)

END












