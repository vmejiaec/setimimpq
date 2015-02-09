
CREATE FUNCTION [dbo].[_Apu_Oferta_Mano_Obra_Costo_Total_Categoria]
(
	@p_apu_oferta_id varchar(17),
    @p_apu_categoria_id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare 
            @v_total numeric(17,4),
			@v_total_indices numeric(17,4)

	select  @v_total = 

(select
isnull( sum(total),0)
from
(
	select 
	  (select
		sum(
       dbo.__multiplicar_cuatro_decimales_2
	   (
		   Costo,
		   dbo._apu_oferta_rubro_cantidad (apu_oferta_rubro_id)
	   )
     )
	   from  apu_oferta_rubro_mano_obra pr
	   where dbo._apu_oferta_rubro_apu_oferta_id (apu_oferta_rubro_id) = @p_apu_oferta_id
	   and apu_oferta_mano_obra.apu_mano_obra_id =pr.Apu_mano_obra_id)total
	from apu_oferta_mano_obra			 
	where  apu_oferta_id = @p_apu_oferta_id
	and apu_categoria_id = @p_apu_categoria_id
)total)

-- JPU Sumar el valor de indices 
select @v_total_indices = isnull( dbo._Apu_Oferta_MO_CostTot_CatInd(@p_apu_oferta_id , @p_apu_categoria_id ),0)
	set @v_total=@v_total+@v_total_indices

    RETURN  isnull(@v_total,0)

END



