CREATE PROCEDURE [dbo].[Par_Mensajeria_ByCodigo]
(
  @p_ver_version_id varchar (17),
  @p_Codigo varchar(200)
)
AS
	SET NOCOUNT ON;
SELECT     
    Id, 
    Codigo, 
    Estado, 
    Fecha, 
    Int_Usuario_Id, 
    Dic_Con_Objeto_Id, 
    Descripcion, 
    Id_Origen,
    dbo._Int_Usuario_Codigo (int_usuario_id) Int_Usuario_Codigo,
    dbo._Int_Usuario_Nombre (int_usuario_id) Int_Usuario_Nombre,
    dbo._Dic_Con_Objeto_Codigo (dic_con_objeto_id) Dic_con_objeto_codigo,
    dbo._Dic_Con_Objeto_Nombre (dic_con_objeto_id) Dic_con_objeto_nombre,
    
    dbo._Dic_Con_Objeto_Dic_Contenedor_Id (dic_con_objeto_id) Dic_contenedor_Id,
    dbo._Dic_Contenedor_Codigo (dbo._Dic_Con_Objeto_Dic_Contenedor_Id (dic_con_objeto_id)) Dic_contenedor_codigo,
    dbo._Dic_Contenedor_Nombre (dbo._Dic_Con_Objeto_Dic_Contenedor_Id (dic_con_objeto_id)) Dic_contenedor_nombre,
   
    dbo._Dic_Con_Objeto_Dic_Objeto_Id (dic_con_objeto_id) Dic_Objeto_Id,
    dbo._Dic_Objeto_Codigo (dbo._Dic_Con_Objeto_Dic_Objeto_Id (dic_con_objeto_id)) Dic_Objeto_Codigo,
    dbo._Dic_Objeto_Nombre (dbo._Dic_Con_Objeto_Dic_Objeto_Id (dic_con_objeto_id)) Dic_Objeto_Nombre,
    
    dbo.Estado('PAR_MENSAJERIA','ESTADO',estado, @p_ver_version_id) estado_nombre

FROM         Par_Mensajeria
where Codigo=@p_Codigo





