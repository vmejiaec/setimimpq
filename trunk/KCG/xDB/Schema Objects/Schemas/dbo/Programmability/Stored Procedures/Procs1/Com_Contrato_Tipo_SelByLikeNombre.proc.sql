CREATE PROCEDURE dbo.Com_Contrato_Tipo_SelByLikeNombre
  (
    	@p_Nombre varchar(200)
  )
AS
	SET NOCOUNT ON;
select 
  Id, 
  Nombre, 
  URL_Plantilla_Word 
from Com_Contrato_Tipo
where UPPER(Nombre) like '%' + UPPER(@p_Nombre) + '%'