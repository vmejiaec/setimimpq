CREATE PROCEDURE [dbo].[par_filtro_update]
(
	@id varchar(17),
	@codigo varchar(200),
	@int_usuario_id varchar(17),
	@dic_con_campo_id varchar(17),
	@estado char(3),
	@Original_id varchar(17),
	@Original_codigo varchar(200),
	@Original_int_usuario_id varchar(17),
	@Original_dic_con_campo_id varchar(17),
	@IsNull_estado Int,
	@Original_estado char(3)
)
AS
	SET NOCOUNT OFF;
UPDATE [Par_Filtro] 
SET [Id] = @id, 
[Codigo] = @codigo, 
[Int_Usuario_Id] = @int_usuario_id, 
[Dic_con_Campo_Id] = @dic_con_campo_id, 
[Estado] = @estado 
WHERE (
([Id] = @Original_id) AND 
([Codigo] = @Original_codigo) AND 
([Int_Usuario_Id] = @Original_int_usuario_id) AND 
([Dic_con_Campo_Id] = @Original_dic_con_campo_id) AND 
((@IsNull_estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_estado)));
	
SELECT Id, Codigo, Int_Usuario_Id, Dic_con_Campo_Id, Estado FROM Par_Filtro WHERE (Id = @id)
