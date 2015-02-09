create PROCEDURE [dbo].[Seg_Rol_SelByLikeNombre]
(
   @p_Ver_Version_Id varchar (17),
   @p_Nombre varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT     
   Id, 
   Codigo, 
   Nombre, 
   Descripcion, 
   Estado,
   dbo.Estado ('SEG_ROL','ESTADO', Estado, @p_Ver_Version_Id) Estado_Nombre
FROM Seg_Rol
where Id in (
select Seg_Rol_Id
from Seg_Rol_Usuario
where Nombre like @p_Nombre)