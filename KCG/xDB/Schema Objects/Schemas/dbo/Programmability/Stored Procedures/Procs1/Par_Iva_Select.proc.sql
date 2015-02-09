CREATE PROCEDURE [dbo].[Par_Iva_Select]
(
	@p_Ver_Version_Id VARCHAR(17)
)
AS
	SET NOCOUNT ON;
SELECT     
	Id, 
	Codigo, 
	Nombre, 
	Valor, 
	Cuenta, 
	Tipo_Auxiliar, 
	Auxiliar, 
	Int_Empresa_Id, 
	Creacion_Per_Personal_Id, 
	Fecha_Creacion, 
	Update_Per_Personal_Id, 
    Fecha_Update, 
	Descripcion,
	Estado,

	dbo.Per_Personal_Codigo (Creacion_Per_Personal_Id) Creacion_Per_Personal_Codigo,
	dbo.Per_Personal_Nombre (Creacion_Per_Personal_Id) Creacion_Per_Personal_Nombre,

	dbo.Per_Personal_Codigo (Update_Per_Personal_Id) Update_Per_Personal_Codigo,
	dbo.Per_Personal_Nombre (Update_Per_Personal_Id) Update_Per_Personal_Nombre,

	dbo.Estado('FAC_TIPO_CLIENTE', 'ESTADO', Estado, 1) Estado_Nombre

FROM Par_Iva