CREATE PROCEDURE [dbo].[Int_Contrato_ByOrigenOrigen_Id]
(
  @p_Origen char(3),
  @p_Apu_Origen_Id varchar(17)

)
AS
	SET NOCOUNT ON;
BEGIN
	DECLARE
		@v_Codigo_Institucional varchar(200),
		@v_Contrato_Tipo VARCHAR(3);

	set @v_Codigo_Institucional =
        dbo._Apu_Presupuesto_Codigo_Institucional(@p_Origen, @p_Apu_Origen_Id);

	set @v_Contrato_Tipo =
        dbo._Apu_Presupuesto_Tipo_Contrato (@p_Origen, @p_Apu_Origen_Id);

	exec dbo.Int_contrato_ByCodigo_Institucional @v_Codigo_Institucional, @v_Contrato_Tipo ;

END





