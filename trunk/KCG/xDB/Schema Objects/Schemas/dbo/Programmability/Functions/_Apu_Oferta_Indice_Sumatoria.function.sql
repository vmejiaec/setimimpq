CREATE FUNCTION dbo._Apu_Oferta_Indice_Sumatoria
(
	@p_apu_Oferta_id varchar(17)
)    
RETURNS numeric (17,2)
BEGIN
    
    declare 
       @v_total numeric (17,2)
       
    select @v_total =
    (select
             sum(dbo._apu_Oferta_Indice_Costo (@p_apu_Oferta_id, Apu_Indice_Id))
     from
			(
        select apu_indice_id
  			from apu_Oferta_material
  			where apu_Oferta_id = @p_apu_Oferta_id
  			group by apu_indice_id
  			
        union
  			
        select apu_indice_id
  			from apu_Oferta_equipo_indice
  			where apu_indice_id <> 
  				  dbo._apu_parametros_Equipo_Apu_Indice_Id(dbo._apu_Oferta_int_sucursal_id (@p_apu_Oferta_id))
  			and dbo._apu_Oferta_equipo_apu_Oferta_id(apu_Oferta_equipo_id) = @p_apu_Oferta_id
  			group by apu_indice_id
  			
        union
  			
        select apu_indice_id 
  			from apu_Oferta_transporte_indice
  			where apu_Oferta_id = @p_apu_Oferta_id
  			group by apu_indice_id
  			
        union
  			
        select ManoObra_Apu_Indice_Id
  			from apu_parametros
  			where int_sucursal_id = dbo._apu_Oferta_int_sucursal_id (@p_apu_Oferta_id)
      ) Apu_Indice
    )

    RETURN isnull(@v_total,0)

END














