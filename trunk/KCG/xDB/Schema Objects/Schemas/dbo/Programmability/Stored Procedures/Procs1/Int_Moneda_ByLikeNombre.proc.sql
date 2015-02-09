
CREATE PROCEDURE [dbo].[Int_Moneda_ByLikeNombre]
(
	@p_Ver_Version_Id varchar(17),
	@p_Int_Sucursal_Id varchar(17),
	@p_Nombre varchar(200)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Nombre, 
   Abreviatura,  
   Moneda_Id_Ref,
   Simbolo,
   Descripcion, 
   Estado, 
   
   dbo.Estado ('INT_MONEDA','ESTADO', estado, @p_ver_version_id) Estado_nombre 

FROM  Int_Moneda
where upper(Nombre) like (upper(@p_Nombre))









