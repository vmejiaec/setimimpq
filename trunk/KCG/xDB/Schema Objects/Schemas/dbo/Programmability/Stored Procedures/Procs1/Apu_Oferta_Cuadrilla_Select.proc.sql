CREATE PROCEDURE [dbo].[Apu_Oferta_Cuadrilla_Select]
(
  @p_apu_Oferta_id varchar (17)
)
AS
	SET NOCOUNT ON;
(
select 
    @p_apu_Oferta_id Apu_Oferta_Id,
    dbo._Apu_Oferta_Codigo (@p_apu_Oferta_id) Apu_Oferta_Codigo,
    dbo._Apu_Oferta_Nombre (@p_apu_Oferta_id) Apu_Oferta_Nombre,
    dbo._Apu_Oferta_Etapa  (@p_apu_Oferta_id) Apu_Oferta_Etapa,

    dbo._Apu_Categoria_Codigo (Apu_Categoria_Id) Apu_Cuadrilla_Codigo,
    dbo._Apu_Categoria_Nombre (Apu_Categoria_Id) Apu_Cuadrilla_Nombre,
    dbo._Apu_Oferta_Mano_Obra_Costo_Total_Categoria (@p_apu_Oferta_id, apu_categoria_id) Costo_Total,
    dbo._Apu_Oferta_Cuadrilla_Coeficiente_Categoria_1(@p_apu_Oferta_id, apu_categoria_id)  Coeficiente,
    dbo._Apu_Oferta_Categoria_Costo_Hora1 (@p_apu_Oferta_id,Apu_Categoria_Id) Costo_Hora,

	dbo._Apu_Oferta_Cuadrilla_Numero_Trabajadores (@p_apu_Oferta_id, apu_categoria_id) Numero_trabajadores,

	Apu_Categoria_Id,
    'CAT' Origen

from
(select apu_categoria_id
from apu_Oferta_mano_obra
where apu_Oferta_id = @p_apu_Oferta_id
and apu_categoria_id is not null
and  dbo._Apu_Oferta_Mano_Obra_Costo_Total_Categoria (@p_apu_Oferta_id, apu_categoria_id) >0
group by apu_categoria_id ) Apu_Categoria_Id
)
UNION
(
select
    @p_apu_Oferta_id Apu_Oferta_Id,
    dbo._Apu_Oferta_Codigo (@p_apu_Oferta_id) Apu_Oferta_Codigo,
    dbo._Apu_Oferta_Nombre (@p_apu_Oferta_id) Apu_Oferta_Nombre,
    dbo._Apu_Oferta_Etapa  (@p_apu_Oferta_id) Apu_Oferta_Etapa,
 
    dbo._Apu_Mano_Obra_Codigo (Apu_Mano_Obra_Id) Apu_Cuadrilla_Codigo,
    dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) Apu_Cuadrilla_Nombre,
    dbo._Apu_Oferta_Mano_Obra_Costo_Total_Cuadrilla(@p_apu_Oferta_id, Apu_mano_Obra_Id) Costo_total,
    dbo._Apu_Oferta_Cuadrilla_Coeficiente_ManoObra_1(@p_apu_Oferta_id, apu_mano_obra_id) Coeficiente,
    dbo._Apu_Oferta_Mano_Obra_Costo_Hora1(@p_apu_Oferta_id, Apu_Mano_Obra_Id) Costo_Hora,

    dbo._Apu_Oferta_Cuadrilla_Numero_Trabajadores1 (@p_apu_Oferta_id, apu_mano_obra_id) Numero_trabajadores,

	Apu_Mano_Obra_Id,
    'MAN' Origen

from
(select Apu_Mano_Obra_Id
from Apu_Oferta_mano_obra
where 
apu_categoria_id is null and 
apu_Oferta_id = @p_apu_Oferta_id
and dbo._Apu_Oferta_Mano_Obra_Costo_Total_Cuadrilla(@p_apu_oferta_id, Apu_mano_Obra_Id) > 0
Group by Apu_Mano_Obra_Id) Apu_Mano_Obra_Id
)
Order by Coeficiente desc





