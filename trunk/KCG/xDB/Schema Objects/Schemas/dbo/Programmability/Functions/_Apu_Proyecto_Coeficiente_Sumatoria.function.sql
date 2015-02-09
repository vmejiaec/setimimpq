
CREATE FUNCTION [dbo].[_Apu_Proyecto_Coeficiente_Sumatoria]
(
	@p_apu_proyecto_id varchar(17)
)    
RETURNS numeric (17,3)
BEGIN
    
    declare 
       @v_total numeric (17,4),
	   @v_Coeficiente numeric (17,4)
       
       
select @v_total =

(select sum(dbo._apu_proyecto_Coeficiente (@p_apu_proyecto_id, Apu_Indice_Id))
 from
			
	(select apu_indice_id
	from apu_proyecto_material
	where apu_proyecto_id = @p_apu_proyecto_id
	and apu_indice_id <> dbo._apu_parametros_Equipo_Apu_Indice_Id(dbo._apu_proyecto_int_sucursal_id (@p_apu_proyecto_id))
	group by apu_indice_id

	union

	select apu_indice_id
	from apu_proyecto_equipo_indice
	where apu_indice_id <> dbo._apu_parametros_Equipo_Apu_Indice_Id(dbo._apu_proyecto_int_sucursal_id (@p_apu_proyecto_id))
	and dbo._apu_proyecto_equipo_apu_proyecto_id(apu_proyecto_equipo_id) = @p_apu_proyecto_id
	group by apu_indice_id

	union

	select apu_indice_id 
	from   apu_proyecto_transporte_indice
	where  apu_proyecto_id = @p_apu_proyecto_id
	and    apu_indice_id <> dbo._apu_parametros_Equipo_Apu_Indice_Id(dbo._apu_proyecto_int_sucursal_id (@p_apu_proyecto_id))
	group by apu_indice_id
	union
	select ManoObra_Apu_Indice_Id
	from apu_parametros
	where int_sucursal_id = dbo._apu_proyecto_int_sucursal_id (@p_apu_proyecto_id)) Apu_Indice)


    --Suma la diferencia del coeficiente para llegar a 1 
    --set @v_Coeficiente = 1 - @v_total;
	  

    RETURN isnull(@v_total,0);
--return @v_total

   

END

















