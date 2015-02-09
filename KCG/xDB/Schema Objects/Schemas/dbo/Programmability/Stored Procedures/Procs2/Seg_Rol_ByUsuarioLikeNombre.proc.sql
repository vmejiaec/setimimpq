

CREATE PROCEDURE [dbo].[Seg_Rol_ByUsuarioLikeNombre]
(
   @p_Ver_Version_Id varchar (17),
   @p_Int_Usuario_Id varchar(17),
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
where Int_Usuario_Id = @p_Int_Usuario_Id)
and Nombre like @p_Nombre




