CREATE FUNCTION [dbo].[_Apu_Oferta_Transporte_Costo_Indice]
(
	@p_apu_Oferta_id varchar(17),
    @p_apu_indice_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
            @v_total numeric(17,4)

   set @v_total = 0
	select  @v_total = 
            (select 
                   isnull(dbo._Apu_Oferta_Costo_Transporte1 (apu_oferta_id, porcentaje),0) 
             from  apu_Oferta_Transporte_indice
             where apu_Oferta_id = @p_apu_Oferta_id
             and apu_indice_id = @p_apu_indice_id)

    RETURN  isnull (@v_total,0)

END











