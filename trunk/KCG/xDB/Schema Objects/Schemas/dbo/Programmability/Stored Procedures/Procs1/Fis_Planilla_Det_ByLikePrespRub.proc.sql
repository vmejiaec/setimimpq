CREATE PROCEDURE [dbo].[Fis_Planilla_Det_ByLikePrespRub]
(
	@p_Ver_Version_Id varchar(17),
	@p_Apu_Presupuesto_Id varchar(17),
	@p_Apu_Rubro_Nombre varchar(500)
)
AS
	SET NOCOUNT ON;
SELECT     
Id, 
Codigo, 
Estado, 
Descripcion, 
Apu_Prespuesto_Rubro_Id, 
Apu_Rubro_Codigo, 
Apu_Rubro_Nombre, 
Apu_Rubro_Unidad, 
Costo, 
Cantidad,
Fis_Planilla_Id,
(Costo * Cantidad) SubTotal,
dbo.Apu_Prespuesto_Rubro_Codigo(Apu_Prespuesto_Rubro_Id) Apu_Prespuesto_Rubro_Codigo,
Convert (numeric(17,4),0) Apu_Prespuesto_Rubro_Cantidad,
Convert (numeric(17,4),0) Acumulado,
Convert (numeric(17,4),0) Diferencia,
dbo.Fis_Planilla_Codigo(Fis_Planilla_Id) Fis_Planilla_Codigo,

dbo.Estado ('FIS_PLANILLA_DET','ESTADO',Estado, @p_Ver_Version_Id) Estado_Nombre

FROM  Fis_Planilla_Det
where Apu_Rubro_Nombre like @p_Apu_Rubro_Nombre
AND Apu_Prespuesto_Rubro_Id in (select Id from Apu_Presupuesto_Rubro where Apu_Presupuesto_Id =  @p_Apu_Presupuesto_Id)
 