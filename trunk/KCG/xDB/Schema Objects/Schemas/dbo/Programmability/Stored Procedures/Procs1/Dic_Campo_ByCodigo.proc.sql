
CREATE PROCEDURE [dbo].[Dic_Campo_ByCodigo]
(
  @p_Ver_Version_Id varchar(17),
  @p_Codigo varchar (200)
)
AS
	SET NOCOUNT ON;
SELECT     
      Id, 
      Codigo, 
      Nombre, 
      Estado, 
      Dic_Objeto_Id, 
      Tipo_Dato, 
      Tipo_Constraint, 
      Filtro,

      dbo.Estado('DIC_CAMPO','ESTADO',Estado,@p_Ver_Version_Id) Estado_Nombre,

      dbo.Dic_Objeto_Codigo (Dic_Objeto_Id) Dic_Objeto_Codigo,
      dbo.Dic_Objeto_Nombre (Dic_Objeto_Id) Dic_Objeto_Nombre,

      dbo.Dominio('DIC_CAMPO','TIPO_DATO',Tipo_Dato, @p_Ver_Version_Id) Tipo_Dato_Nombre,
      dbo.Dominio('DIC_CAMPO','TIPO_CONSTRAINT',Tipo_Constraint, @p_Ver_Version_Id) Tipo_Constraint_Nombre,
      dbo.Dominio('DIC_CAMPO','FILTRO',Filtro, @p_Ver_Version_Id) Filtro_Nombre,

      dbo.Dic_Objeto_Dic_Modulo_Id(Dic_Objeto_Id) Dic_Modulo_Id,  
      dbo.Dic_Modulo_Codigo (dbo.Dic_Objeto_Dic_Modulo_Id(Dic_Objeto_Id)) Dic_Modulo_Codigo,
      dbo.Dic_Modulo_Nombre (dbo.Dic_Objeto_Dic_Modulo_Id(Dic_Objeto_Id)) Dic_Modulo_Nombre,

-- Alexandra Cazar 31/07/2008   

	  null Sug_Dic_Rotulo_Id,
      null Sug_Dic_Rotulo_Nombre,
      null Sug_Dic_Rotulo_Codigo,

	  null SugTool_Dic_Rotulo_Id,
      null SugTool_Dic_Rotulo_Nombre,
      null SugTool_Dic_Rotulo_Codigo

FROM    Dic_Campo
Where   Codigo = @p_Codigo









