
CREATE PROCEDURE [dbo].[Apu_Proyecto_Diferencia_ByProyecto]
(
  @p_apu_proyecto_id varchar(17),
  @p_int_empresa_id varchar(17)
)
AS
	SET NOCOUNT ON;
select 
  id Apu_Proyecto_Id,

  Codigo Apu_proyecto_Codigo,
  Nombre Apu_proyecto_Nombre,
  Etapa Apu_proyecto_Etapa,

  dbo._Apu_Indice_Codigo (dbo._Apu_Indice_Varios(@p_int_empresa_id)) Apu_Indice_Codigo,
  dbo._Apu_Indice_Nombre (dbo._Apu_Indice_Varios(@p_int_empresa_id)) Apu_Indice_Nombre,


  dbo._Apu_Proyecto_Costo_Directo	(id) - dbo._Apu_Proyecto_Indice_Sumatoria	(Id) costo_total,
  (1 -  dbo._Apu_Proyecto_Coeficiente_Sumatoria	(Id) ) Coeficiente, 

  'X' as Letra 

from  Apu_Proyecto
where id = @p_apu_proyecto_id
and (dbo._Apu_Proyecto_Costo_Directo (id) <> dbo._Apu_Proyecto_Indice_Sumatoria	(Id)
or  dbo._Apu_Proyecto_Coeficiente_Sumatoria	(Id) <> 1)











