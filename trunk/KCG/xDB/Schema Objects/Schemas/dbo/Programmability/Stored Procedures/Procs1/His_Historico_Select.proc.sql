CREATE PROCEDURE [dbo].[His_Historico_Select]
AS
	SET NOCOUNT ON;
SELECT     Id, Codigo, Dic_Objeto_Id, Dic_Objeto_Codigo, Dic_Objeto_Nombe, Fecha_Creacion, Per_Personal_Id, Per_Personal_Codigo, Per_Personal_Nombre, 
                      Int_Usuario_Id, Int_Usuario_Codigo, Int_Usuario_Nombre, Int_Empresa_Id, Int_Empresa_Codigo, Int_Empresa_Nombre, Int_Sucursal_Id, 
                      Int_Sucursal_Codigo, Int_Sucursal_Nombre, Descripcion, Estado
FROM         His_Historico
