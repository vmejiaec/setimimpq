CREATE PROCEDURE dbo.Aud_Par_Auditoria_Delete
(
	@Original_Id varchar(17),
	@Original_Codigo varchar(200),
	@Original_Int_Sucursal_Id varchar(17),
	@Original_Dic_Objeto_Id varchar(17),
	@Original_INS varchar(3),
	@Original_UPD varchar(3),
	@Original_DEL varchar(3),
	@Original_UNI varchar(3),
	@Original_SEL varchar(3),
	@Original_BIN varchar(3),
	@Original_BUP varchar(3),
	@Original_BDE varchar(3),
	@IsNull_Estado Int,
	@Original_Estado char(3)
)
AS
	SET NOCOUNT OFF;
DELETE FROM [Aud_Par_Auditoria] WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Int_Sucursal_Id] = @Original_Int_Sucursal_Id) AND ([Dic_Objeto_Id] = @Original_Dic_Objeto_Id) AND ([INS] = @Original_INS) AND ([UPD] = @Original_UPD) AND ([DEL] = @Original_DEL) AND ([UNI] = @Original_UNI) AND ([SEL] = @Original_SEL) AND ([BIN] = @Original_BIN) AND ([BUP] = @Original_BUP) AND ([BDE] = @Original_BDE) AND ((@IsNull_Estado = 1 AND [Estado] IS NULL) OR ([Estado] = @Original_Estado)))