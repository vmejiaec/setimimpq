
create PROCEDURE [dbo].[Com_Planilla_Deposito_SelByFis_Planilla_Id]
(
@p_Fis_Planilla_Id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT        Id, Fis_Planilla_Id, Codigo_Deposito, Fecha_Deposito, Comprobante_Ctbl, Valor, Valor_Interes, Descripcion
FROM            Com_Planilla_Deposito
where Fis_Planilla_Id = @p_Fis_Planilla_Id