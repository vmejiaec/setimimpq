﻿create PROCEDURE [dbo].[Pla_Lote_SelById]
(
   @p_Id int
)
AS
	SET NOCOUNT ON;
SELECT        Id, Codigo, Nombre, URL_Archivo_IN, Pla_Lote_Tipo_Id, Resultado, URL_Archivo_OUT, Estado, Lote_Fecha
FROM            Pla_Lote
where Id = @p_Id
