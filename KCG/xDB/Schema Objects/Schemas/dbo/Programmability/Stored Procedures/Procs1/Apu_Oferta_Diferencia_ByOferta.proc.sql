CREATE PROCEDURE [dbo].[Apu_Oferta_Diferencia_ByOferta]
(
  @p_apu_Oferta_id varchar(17),
  @p_int_Empresa_Id varchar(17)	
)
AS
	SET NOCOUNT ON;

select 
  id Apu_Oferta_Id,

  Codigo Apu_Oferta_Codigo,
  Nombre Apu_Oferta_Nombre,
  Etapa Apu_Oferta_Etapa,

  dbo._Apu_Indice_Nombre (dbo._Apu_Indice_Varios(@p_int_empresa_id)) Apu_Indice_Nombre,
  dbo._Apu_Indice_Codigo (dbo._Apu_Indice_Varios(@p_int_empresa_id)) Apu_Indice_Codigo,

  dbo._Apu_Oferta_Costo_Directo	(id) - dbo._Apu_Oferta_Indice_Sumatoria	(Id) costo_total,
  (1 - dbo._Apu_Oferta_Coeficiente_Sumatoria (id)) coeficiente, 
  'X' as Letra 

from  apu_oferta
where id = @p_apu_oferta_id
and dbo._Apu_Oferta_Costo_Total(id) 
<> dbo._Apu_Oferta_Indice_Sumatoria (id)








