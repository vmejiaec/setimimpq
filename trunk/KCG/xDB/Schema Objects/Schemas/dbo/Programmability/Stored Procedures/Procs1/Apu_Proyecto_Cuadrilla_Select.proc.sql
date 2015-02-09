CREATE PROCEDURE [dbo].[Apu_Proyecto_Cuadrilla_Select]
(
  @p_apu_proyecto_id varchar (17)
)
AS
	SET NOCOUNT ON;
(
select 
    @p_apu_proyecto_id Apu_Proyecto_Id,
    dbo._Apu_Proyecto_Codigo (@p_apu_proyecto_id) Apu_proyecto_Codigo,
    dbo._Apu_Proyecto_Nombre (@p_apu_proyecto_id) Apu_proyecto_Nombre,
    dbo._Apu_Proyecto_Etapa  (@p_apu_proyecto_id) Apu_proyecto_Etapa,

    dbo._Apu_Categoria_Codigo (Apu_Categoria_Id) Apu_Cuadrilla_Codigo,
    dbo._Apu_Categoria_Nombre (Apu_Categoria_Id) Apu_Cuadrilla_Nombre,
    dbo._Apu_Proyecto_Mano_Obra_Costo_Total_Categoria (@p_apu_proyecto_id, apu_categoria_id) Costo_Total,
    dbo._Apu_Proyecto_Categoria_Costo_Hora1 (@p_apu_proyecto_id,Apu_Categoria_Id) Costo_Hora,
    dbo._Apu_Proyecto_Cuadrilla_Numero_Trabajadores (@p_apu_proyecto_id, apu_categoria_id) Numero_trabajadores,
    dbo._Apu_Proyecto_Cuadrilla_Coeficiente_Categoria_1(@p_apu_proyecto_id, apu_categoria_id)  Coeficiente,
	Apu_Categoria_Id,
    'CAT' Origen

from
(select apu_categoria_id
from apu_proyecto_mano_obra
where apu_proyecto_id = @p_apu_proyecto_id
and apu_categoria_id is not null
and     dbo._Apu_Proyecto_Mano_Obra_Costo_Total_Categoria (@p_apu_proyecto_id, apu_categoria_id)>0
group by apu_categoria_id ) Apu_Categoria_Id
)

UNION
(
select
    @p_apu_proyecto_id Apu_Proyecto_Id,
    dbo._Apu_Proyecto_Codigo (@p_apu_proyecto_id) Apu_proyecto_Codigo,
    dbo._Apu_Proyecto_Nombre (@p_apu_proyecto_id) Apu_proyecto_Nombre,
    dbo._Apu_Proyecto_Etapa  (@p_apu_proyecto_id) Apu_proyecto_Etapa,
 
    dbo._Apu_Mano_Obra_Codigo (Apu_Mano_Obra_Id) Apu_Cuadrilla_Codigo,
    dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) Apu_Cuadrilla_Nombre,
    dbo._Apu_Proyecto_Mano_Obra_Costo_Total_Cuadrilla(@p_apu_proyecto_id, Apu_mano_Obra_Id) Costo_total,
    dbo._Apu_Proyecto_Mano_Obra_Costo_Hora1 (@p_apu_proyecto_id, Apu_Mano_Obra_Id) Costo_Hora,
    dbo._Apu_Proyecto_Cuadrilla_Numero_Trabajadores1 (@p_apu_proyecto_id, apu_mano_obra_id) Numero_trabajadores,
	dbo._Apu_Proyecto_Cuadrilla_Coeficiente_ManoObra_1(@p_apu_proyecto_id, apu_mano_obra_id)  Coeficiente,
	Apu_Mano_Obra_Id,
    'MAN' Origen

from
(select Apu_Mano_Obra_Id
from Apu_proyecto_mano_obra
where 
apu_categoria_id is null
and 
apu_proyecto_id = @p_apu_proyecto_id
and dbo._Apu_Proyecto_Mano_Obra_Costo_Total_Cuadrilla(@p_apu_proyecto_id, Apu_mano_Obra_Id) > 0
Group by Apu_Mano_Obra_Id) Apu_Mano_Obra_Id
)

Order by Coeficiente desc


