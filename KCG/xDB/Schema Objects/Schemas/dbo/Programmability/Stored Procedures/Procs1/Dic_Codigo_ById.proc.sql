CREATE PROCEDURE [dbo].[Dic_Codigo_ById]
(
   @p_Ver_Version_Id varchar(17),
   @p_Id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT     
  Id, 
  Codigo, 
  Orden,
  Tipo,
  Dic_Campo_Id, 
  Act_Dic_Campo_Id ,
  Ref_Dic_Campo_Id ,   
  Dic_Secuencia_Id ,
  Pre_Dic_Campo_Id ,
  Constante, 
  Funcion,
  Estado,

  dbo._Dic_Secuencia_Codigo (Dic_secuencia_Id) Dic_Secuencia_Codigo,
  dbo._Dic_Secuencia_Nombre (Dic_secuencia_Id) Dic_Secuencia_Nombre,
  dbo._Dic_Campo_Codigo (Ref_Dic_Campo_Id) Ref_dic_Campo_Codigo,
  dbo._Dic_Campo_Nombre (Ref_Dic_Campo_Id) Ref_Dic_Campo_Nombre,
  dbo._Dic_Campo_Codigo (Dic_Campo_Id) Dic_Campo_Codigo,
  dbo._Dic_Campo_Nombre (Dic_Campo_Id) Dic_Campo_Nombre,
  dbo._Dic_Campo_Dic_Objeto_Id (Dic_Campo_ID) Dic_Objeto_Id,
  dbo._Dic_Objeto_Codigo (dbo._Dic_Campo_Dic_Objeto_Id (Dic_Campo_ID))Dic_Objeto_Codigo,
  dbo._Dic_Objeto_Nombre (dbo._Dic_Campo_Dic_Objeto_Id (Dic_Campo_ID))Dic_Objeto_Nombre,
  dbo._Dic_Campo_Dic_Modulo_Id(Dic_Campo_Id) Dic_Modulo_Id,
  dbo._Dic_Modulo_Codigo(dbo._Dic_Campo_Dic_Modulo_Id(Dic_Campo_Id)) Dic_Modulo_Codigo,
  dbo._Dic_Modulo_Nombre(dbo._Dic_Campo_Dic_Modulo_Id(Dic_Campo_Id)) Dic_Modulo_Nombre,
  dbo._Dic_Campo_Dic_Modulo_Id(Ref_Dic_Campo_Id) Ref_Dic_Modulo_Id,
  dbo._Dic_Modulo_Codigo(dbo._Dic_Campo_Dic_Modulo_Id(Ref_Dic_Campo_Id)) Ref_Dic_Modulo_Codigo,
  dbo._Dic_Modulo_Nombre(dbo._Dic_Campo_Dic_Modulo_Id(Ref_Dic_Campo_Id)) Ref_Dic_Modulo_Nombre,
  dbo._Dic_Campo_Dic_Objeto_Id (Ref_Dic_Campo_ID) Ref_Dic_Objeto_Id,
  dbo._Dic_Objeto_Codigo (dbo._Dic_Campo_Dic_Objeto_Id (Ref_Dic_Campo_ID))Ref_Dic_Objeto_Codigo,
  dbo._Dic_Objeto_Nombre (dbo._Dic_Campo_Dic_Objeto_Id (Ref_Dic_Campo_ID))Ref_Dic_Objeto_Nombre,
  dbo._Dic_Campo_Codigo (Act_Dic_Campo_Id) Act_Dic_Campo_Codigo,
  dbo._Dic_Campo_Nombre (Act_Dic_Campo_Id) Act_Dic_Campo_Nombre,
  dbo._Dic_Campo_Dic_Modulo_Id(Act_Dic_Campo_Id) Act_Dic_Modulo_Id,
  dbo._Dic_Modulo_Codigo(dbo._Dic_Campo_Dic_Modulo_Id(Act_Dic_Campo_Id)) Act_Dic_Modulo_Codigo,
  dbo._Dic_Modulo_Nombre(dbo._Dic_Campo_Dic_Modulo_Id(Act_Dic_Campo_Id)) Act_Dic_Modulo_Nombre,   
  dbo._Dic_Campo_Dic_Objeto_Id (Act_Dic_Campo_ID) Act_Dic_Objeto_Id,
  dbo._Dic_Objeto_Codigo (dbo._Dic_Campo_Dic_Objeto_Id (Act_Dic_Campo_ID)) Act_Dic_Objeto_Codigo,
  dbo._Dic_Objeto_Nombre (dbo._Dic_Campo_Dic_Objeto_Id (Act_Dic_Campo_ID)) Act_Dic_Objeto_Nombre,

  dbo._Dic_Campo_Codigo (Pre_Dic_Campo_Id) Pre_Dic_Campo_Codigo,
  dbo._Dic_Campo_Nombre (Pre_Dic_Campo_Id) Pre_Dic_Campo_Nombre,
  dbo._Dic_Campo_Dic_Objeto_Id (Pre_Dic_Campo_Id) Pre_Dic_Objeto_Id,
  dbo._Dic_Objeto_Codigo (dbo._Dic_Campo_Dic_Objeto_Id (Pre_Dic_Campo_Id)) Pre_Dic_Objeto_Codigo,
  dbo._Dic_Objeto_Nombre (dbo._Dic_Campo_Dic_Objeto_Id (Pre_Dic_Campo_Id)) Pre_Dic_Objeto_Nombre,


  dbo.Estado ('DIC_CODIGO','ESTADO', estado, @p_ver_version_id) Estado_nombre,
  dbo.Dominio ('DIC_CODIGO','TIPO',tipo, @p_ver_version_id) Tipo_nombre
FROM         Dic_Codigo
where Id=@p_Id












