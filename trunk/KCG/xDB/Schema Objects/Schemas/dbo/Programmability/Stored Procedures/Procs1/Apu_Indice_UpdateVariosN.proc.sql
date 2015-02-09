CREATE PROCEDURE [dbo].[Apu_Indice_UpdateVariosN]
(
  @p_Int_Empresa_Id varchar(17)
)
AS
	SET NOCOUNT ON;

update Apu_Indice
set varios = 'N'
where int_empresa_id = @p_int_Empresa_id
 
select count(*) 
from Apu_Indice
where int_empresa_id = @p_int_Empresa_id
and varios = 'S'



