CREATE PROCEDURE [dbo].[Dic_Campo_Select]
(
	@p_Ver_Version_Id varchar(17)
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

	  -- Campos agregados 31/07/2008   

	  dbo.Dic_Rotulo_Id(Nombre)Sug_Dic_Rotulo_Id,
      dbo.Dic_Rotulo_Nombre(dbo.Dic_Rotulo_Id(Nombre)) Sug_Dic_Rotulo_Nombre,
      dbo.Dic_Rotulo_Codigo(dbo.Dic_Rotulo_Id(Nombre)) Sug_Dic_Rotulo_Codigo,

	  dbo.Dic_Rotulo_Id('Tool_'+ Nombre)SugTool_Dic_Rotulo_Id,
      dbo.Dic_Rotulo_Nombre(dbo.Dic_Rotulo_Id('Tool_'+Nombre)) SugTool_Dic_Rotulo_Nombre,
      dbo.Dic_Rotulo_Codigo(dbo.Dic_Rotulo_Id('Tool_'+Nombre)) SugTool_Dic_Rotulo_Codigo

FROM  Dic_Campo