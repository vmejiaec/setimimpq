CREATE PROCEDURE [dbo].[Fis_Catalogo_ByLikeNombre]
(
	@p_Ver_Version_Id varchar(17),
	@p_Nombre varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT     
		Id, 
		Codigo, 
		Estado, 
		Descripcion, 
		Int_Empresa_Id, 
		Fecha_Creacion, 
		Creacion_Per_Personal_Id, 
		Fecha_Publicacion, 
		Nombre,

		dbo._Int_Empresa_Codigo (Int_Empresa_Id) Int_Empresa_Codigo,
		dbo._Int_Empresa_nombre (Int_Empresa_Id) Int_Empresa_Nombre,

		dbo._Per_Personal_Codigo(Creacion_Per_Personal_Id) Creacion_Per_Personal_Codigo,
		dbo._Per_Personal_Nombre(Creacion_Per_Personal_Id) Creacion_Per_Personal_Nombre,

		dbo.Estado ('FIS_CATALOGO','ESTADO',Estado, @p_Ver_Version_Id) Estado_Nombre

FROM    Fis_Catalogo
where Nombre = @p_Nombre