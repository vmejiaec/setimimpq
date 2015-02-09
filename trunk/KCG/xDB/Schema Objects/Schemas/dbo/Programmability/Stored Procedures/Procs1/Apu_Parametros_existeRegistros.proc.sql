CREATE PROCEDURE [dbo].[Apu_Parametros_existeRegistros]
( 
  @p_int_sucursal_id varchar(17)
)
AS
	SET NOCOUNT ON;
select count(*) as existeRegistros 
from apu_parametros
where int_sucursal_id = @p_int_sucursal_id

