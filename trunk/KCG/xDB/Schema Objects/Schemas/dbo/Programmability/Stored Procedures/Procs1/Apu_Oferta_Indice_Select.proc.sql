CREATE PROCEDURE [dbo].[Apu_Oferta_Indice_Select]
(
  @p_apu_Oferta_id varchar(17)
)
AS

--MODIFICADO JPU 28-09-2009
--Se realizan la union de dos consultas para presentar los indices en orden alfabetico. B, C, D, E,F,G, etc

	SET NOCOUNT ON;


	 declare 
       @v_int_sucursal_Id varchar(17),
       @v_int_empresa_id varchar(17),
       @v_apu_indice_varios_id varchar(17),
       @v_letra_cursor  char(1),
	   @v_indice_id_cursor varchar(17),
       @v_ManoObra_apu_indice_id varchar(17)

    exec @v_int_sucursal_id = dbo._apu_Oferta_int_sucursal_id @p_apu_Oferta_id
    exec @v_int_empresa_id = dbo._int_sucursal_int_empresa_id @v_int_sucursal_id
    exec @v_apu_indice_varios_id = dbo._apu_indice_varios @v_int_empresa_id
    exec @v_ManoObra_apu_indice_id = dbo._apu_parametros_ManoObra_Apu_Indice_Id @v_int_sucursal_id

select 
  @p_apu_Oferta_id Apu_Oferta_Id,

  dbo._Apu_Oferta_Codigo (@p_apu_Oferta_id) Apu_Oferta_Codigo,
  dbo._Apu_Oferta_Nombre (@p_apu_Oferta_id) Apu_Oferta_Nombre,
  dbo._Apu_Oferta_Etapa  (@p_apu_Oferta_id) Apu_Oferta_Etapa,

  dbo._Apu_Indice_Nombre (Apu_Indice_Id) Apu_Indice_Nombre,
  dbo._Apu_Indice_Codigo (Apu_Indice_Id) Apu_Indice_Codigo,

  dbo._Apu_Oferta_Indice_Costo (@p_apu_Oferta_id, Apu_Indice_Id) Costo_Total,
  dbo._Apu_Oferta_Coeficiente (@p_apu_Oferta_id, Apu_Indice_Id) Coeficiente,
  Apu_Indice_Id,
  Letra 

from 

(

select 
  Apu_Indice_Id,
  dbo._Apu_Oferta_Letra (@p_apu_Oferta_id, 
                           Apu_Indice_Id, 
                           row_number() over (order by dbo._Apu_Oferta_Indice_Costo (@p_apu_Oferta_id, Apu_Indice_Id)desc)) as Letra 
  
from 

(select apu_indice_id
from apu_Oferta_material
where apu_Oferta_id = @p_apu_Oferta_id
and apu_indice_id <> dbo._Apu_Parametros_Equipo_Apu_Indice_Id(dbo._Apu_Oferta_Int_Sucursal_Id (@p_apu_Oferta_id))
and  apu_indice_id <> @v_apu_indice_varios_id
and apu_indice_id <> @v_ManoObra_apu_indice_id
group by apu_indice_id
union
select apu_indice_id
from apu_Oferta_equipo_indice
where dbo._Apu_Oferta_Equipo_Apu_Oferta_Id(apu_Oferta_equipo_id) = @p_apu_Oferta_id
and apu_indice_id <> dbo._Apu_Parametros_Equipo_Apu_Indice_Id(dbo._Apu_Oferta_Int_Sucursal_Id (@p_apu_Oferta_id))
and  apu_indice_id <> @v_apu_indice_varios_id
and apu_indice_id <> @v_ManoObra_apu_indice_id

group by apu_indice_id
union
select apu_indice_id 
from apu_Oferta_transporte_indice
where apu_Oferta_id = @p_apu_Oferta_id
and apu_indice_id <> dbo._Apu_Parametros_Equipo_Apu_Indice_Id(dbo._Apu_Oferta_Int_Sucursal_Id (@p_apu_Oferta_id))
and  apu_indice_id <> @v_apu_indice_varios_id
and apu_indice_id <> @v_ManoObra_apu_indice_id
group by apu_indice_id
--union
--select ManoObra_Apu_Indice_Id
--from apu_parametros
--where int_sucursal_id = dbo._Apu_Oferta_Int_Sucursal_Id (@p_apu_Oferta_id)

) Apu_Indice

UNION

select 
  Apu_Indice_Id,
  dbo._Apu_Oferta_Letra (@p_apu_Oferta_id, 
                           Apu_Indice_Id, 
                           row_number() over (order by dbo._Apu_Oferta_Indice_Costo (@p_apu_Oferta_id, Apu_Indice_Id)desc)) as Letra 
  
from 

(select apu_indice_id
from apu_Oferta_material
where apu_Oferta_id = @p_apu_Oferta_id
and  apu_indice_id = @v_apu_indice_varios_id
group by apu_indice_id
union
select apu_indice_id
from apu_Oferta_equipo_indice
where dbo._Apu_Oferta_Equipo_Apu_Oferta_Id(apu_Oferta_equipo_id) = @p_apu_Oferta_id
and  apu_indice_id = @v_apu_indice_varios_id

group by apu_indice_id
union
select apu_indice_id 
from apu_Oferta_transporte_indice
where apu_Oferta_id = @p_apu_Oferta_id
and  apu_indice_id = @v_apu_indice_varios_id

group by apu_indice_id
union
select ManoObra_Apu_Indice_Id
from apu_parametros
where int_sucursal_id = dbo._Apu_Oferta_Int_Sucursal_Id (@p_apu_Oferta_id)

) Apu_Indice




) Apu_Indice


Order By Letra