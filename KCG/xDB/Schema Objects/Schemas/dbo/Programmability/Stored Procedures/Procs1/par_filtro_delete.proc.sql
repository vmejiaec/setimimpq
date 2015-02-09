CREATE PROCEDURE [dbo].[par_filtro_delete]
(
	@Original_id varchar(17),
	@Original_codigo varchar(200),
	@Original_int_usuario_id varchar(17),
	@Original_dic_con_campo_id varchar(17),
	@IsNull_estado Int,
	@Original_estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Par_Filtro] 
WHERE (
([Id] = @Original_id) AND 
([Codigo] = @Original_codigo) AND 
([Int_Usuario_Id] = @Original_int_usuario_id) AND 
([Dic_con_Campo_Id] = @Original_dic_con_campo_id) AND 
((@IsNull_estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_estado)))
