CREATE PROCEDURE [dbo].[Apu_Indice_existeRegistros]
(
  @p_Int_Empresa_Id varchar(17)
)
AS
	SET NOCOUNT ON;
select count(*) as existeRegistros 
from Apu_Indice
where int_empresa_id = @p_int_empresa_id


