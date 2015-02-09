CREATE PROCEDURE dbo.Aud_Par_Auditoria_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Int_Sucursal_Id varchar(17),
	@Dic_Objeto_Id varchar(17),
	@INS varchar(3),
	@UPD varchar(3),
	@DEL varchar(3),
	@UNI varchar(3),
	@SEL varchar(3),
	@BIN varchar(3),
	@BUP varchar(3),
	@BDE varchar(3),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Aud_Par_Auditoria] ([Id], [Codigo], [Int_Sucursal_Id], [Dic_Objeto_Id], [INS], [UPD], [DEL], [UNI], [SEL], [BIN], [BUP], [BDE], [Estado]) VALUES (@Id, @Codigo, @Int_Sucursal_Id, @Dic_Objeto_Id, @INS, @UPD, @DEL, @UNI, @SEL, @BIN, @BUP, @BDE, @Estado);
	
SELECT Id, Codigo, Int_Sucursal_Id, Dic_Objeto_Id, INS, UPD, DEL, UNI, SEL, BIN, BUP, BDE, Estado FROM Aud_Par_Auditoria WHERE (Id = @Id)