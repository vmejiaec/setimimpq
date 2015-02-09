
create PROCEDURE [dbo].[Com_Planilla_Deposito_SelById]
(
@p_Id int
)
AS
	SET NOCOUNT ON;
SELECT        Id, Fis_Planilla_Id, Codigo_Deposito, Fecha_Deposito, Comprobante_Ctbl, Valor, Valor_Interes, Descripcion
FROM            Com_Planilla_Deposito
where Id = @p_Id