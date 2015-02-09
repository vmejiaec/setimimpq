CREATE FUNCTION [dbo].[_Apu_Oferta_Mano_Obra_Costo_Categoria]
(
	@p_apu_Oferta_id varchar(17),
    @p_apu_categoria_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
            @v_total numeric(17,4)

	select  @v_total = 
            (select 
                   isnull(sum(dbo._Apu_Oferta_Rubro_Costo_Mano_Obra1
                    (apu_oferta_id, apu_mano_obra_id)),0) 
             from  apu_Oferta_mano_obra
             where apu_Oferta_id = @p_apu_Oferta_id
             and apu_categoria_id = @p_apu_categoria_id)

    RETURN  isnull(@v_total,0)

END










