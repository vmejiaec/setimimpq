CREATE FUNCTION [dbo].[_Apu_Oferta_Material_Costo_Indice]
(
	@p_apu_Oferta_id varchar(17),
    @p_apu_Indice_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
            @v_total numeric(17,4)

    set @v_total = 0

	select  @v_total = 
            (select 
                   sum(dbo._Apu_Oferta_Rubro_Material_Costo_x_Cantidad(id))
             from  apu_Oferta_Rubro_material
             where dbo._apu_oferta_rubro_apu_Oferta_id (apu_oferta_rubro_id) = @p_apu_Oferta_id
             and apu_material_id in 
             (select apu_material_id
              from apu_oferta_material
              where apu_indice_id = @p_apu_indice_id
              and apu_oferta_id = @p_apu_oferta_id))

    RETURN  isnull(@v_total,0)

END









