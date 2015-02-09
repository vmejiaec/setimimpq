CREATE PROCEDURE [dbo].[par_filtro_insert]
(
	@id varchar(17),
	@codigo varchar(200),
	@int_usuario_id varchar(17),
	@dic_con_campo_id varchar(17),
	@estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Par_Filtro] 
([Id], [Codigo], [Int_Usuario_Id], 
[Dic_con_Campo_Id], [Estado]) 
VALUES (@id, @codigo, @int_usuario_id, @dic_con_campo_id, @estado);
	
SELECT Id, Codigo, Int_Usuario_Id, Dic_con_Campo_Id, Estado FROM Par_Filtro WHERE (Id = @id)
