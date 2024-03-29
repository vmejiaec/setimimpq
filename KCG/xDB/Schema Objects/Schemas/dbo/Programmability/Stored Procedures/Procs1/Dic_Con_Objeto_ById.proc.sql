﻿
CREATE PROCEDURE [dbo].[Dic_Con_Objeto_ById]
(
	@p_Ver_Version_Id varchar(17),
	@p_Id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT     
	Id, 
	Codigo, 
	Dic_Contenedor_Id, 
	Dic_Objeto_Id, 
	Orden, 
	Estado,
	INS,
	UPD,
	DEL,
	Maximo,
	dbo._Dic_Con_Objeto_Nombre (Id)Nombre ,
	dbo._Dic_Contenedor_Codigo (Dic_Contenedor_Id) Dic_Contenedor_Codigo,
	dbo._Dic_Contenedor_Nombre (Dic_Contenedor_Id) Dic_Contenedor_Nombre,
	dbo._Dic_Objeto_Codigo(Dic_Objeto_Id) Dic_Objeto_Codigo,
	dbo._Dic_Objeto_Nombre(Dic_Objeto_Id) Dic_Objeto_Nombre,   
	dbo._Dic_Contenedor_Dic_Modulo_Id (Dic_Contenedor_Id) Contenedor_Dic_Modulo_Id,
	dbo._Dic_Modulo_Codigo (dbo.Dic_Contenedor_Dic_Modulo_Id (Dic_Contenedor_Id)) Contenedor_Dic_Modulo_Codigo,
	dbo._Dic_Modulo_Nombre (dbo.Dic_Contenedor_Dic_Modulo_Id (Dic_Contenedor_Id)) Contenedor_Dic_Modulo_Nombre, 
	dbo._Dic_Objeto_Dic_Modulo_Id (Dic_Objeto_Id) Objeto_Dic_Modulo_Id,
	dbo._Dic_Modulo_Codigo (dbo.Dic_Objeto_Dic_Modulo_Id (Dic_Objeto_Id)) Objeto_Dic_Modulo_Codigo,
	dbo._Dic_Modulo_Nombre (dbo.Dic_Objeto_Dic_Modulo_Id (Dic_Objeto_Id)) Objeto_Dic_Modulo_Nombre,
    
	dbo.Dominio ('DIC_CON_OBJETO','INS', INS, @p_Ver_Version_Id) Ins_Nombre,
	dbo.Dominio ('DIC_CON_OBJETO','UPD', UPD, @p_Ver_Version_Id) Upd_Nombre,
	dbo.Dominio ('DIC_CON_OBJETO','DEL', DEL, @p_Ver_Version_Id) Del_Nombre,
 
	dbo.Estado ('DIC_CON_OBJETO','ESTADO', Estado, @p_Ver_Version_Id) Estado_Nombre
 
FROM Dic_Con_Objeto
WHERE Id=@p_Id