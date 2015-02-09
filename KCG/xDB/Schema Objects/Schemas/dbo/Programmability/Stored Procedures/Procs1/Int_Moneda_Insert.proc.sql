CREATE PROCEDURE dbo.Int_Moneda_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Abreviatura varchar(50),
	@Moneda_Id_Ref varchar(200),
	@Simbolo varchar(5),
	@Descripcion varchar(2000),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Int_Moneda] ([Id], [Codigo], [Nombre], [Abreviatura], [Moneda_Id_Ref], [Simbolo], [Descripcion], [Estado]) VALUES (@Id, @Codigo, @Nombre, @Abreviatura, @Moneda_Id_Ref, @Simbolo, @Descripcion, @Estado);
	
SELECT Id, Codigo, Nombre, Abreviatura, Moneda_Id_Ref, Simbolo, Descripcion, Estado FROM Int_Moneda WHERE (Id = @Id)