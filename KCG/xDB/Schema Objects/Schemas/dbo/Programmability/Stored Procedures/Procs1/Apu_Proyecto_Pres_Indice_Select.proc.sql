CREATE PROCEDURE [dbo].[Apu_Proyecto_Pres_Indice_Select]
(
  @p_apu_origen_id varchar(17)
)
AS
	SET NOCOUNT ON;
	Declare @v_Equipo_Apu_Indice_Id varchar(17),
	@v_int_sucursal_id varchar(17)

   -- se obtiene la sucursal del proyecto
   exec @v_int_sucursal_id = dbo._Apu_Proyecto_Int_Sucursal_Id @p_apu_origen_id

   -- Se obtiene el indice del mecanico de mantenimiento
    exec @v_Equipo_Apu_Indice_id = dbo._Apu_Parametros_Equipo_Apu_Indice_Id @v_int_sucursal_id

Select 
  MAX(Apu_Origen_Id) Apu_Origen_Id,
  MAX(dbo._Apu_Proyecto_Codigo (Apu_Origen_Id)) Apu_proyecto_Codigo,
  MAX(dbo._Apu_Proyecto_Nombre (Apu_Origen_Id)) Apu_proyecto_Nombre,
  MAX(dbo._Apu_Proyecto_Etapa  (Apu_Origen_Id)) Apu_proyecto_Etapa,

  MAX(dbo._Apu_Indice_Nombre (Apu_Indice_Id)) Apu_Indice_Nombre,
  MAX(dbo._Apu_Indice_Codigo (Apu_Indice_Id)) Apu_Indice_Codigo ,

  MAX( dbo._Apu_Proyecto_Pres_Indice_Costo (@p_apu_origen_id, Apu_Indice_Id)) Costo_Total,
  dbo._Apu_Proyecto_Pres_Coeficiente (@p_apu_origen_id, Apu_Indice_Id) Coeficiente,
  dbo._Apu_Proyecto_Letra (max(Apu_Origen_Id), 
                           Apu_Indice_Id, 
                           row_number() over (order by dbo._Apu_Proyecto_Pres_Indice_Costo (@p_apu_origen_id, Apu_Indice_Id)desc)) as Letra 

from Apu_Presupuesto_Indice
where Apu_Origen_Id=@p_apu_origen_id
and Apu_Indice_Id<>@v_Equipo_Apu_Indice_id
group by Apu_Indice_Id











