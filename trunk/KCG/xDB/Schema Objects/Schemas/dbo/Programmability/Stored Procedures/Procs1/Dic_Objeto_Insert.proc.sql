CREATE PROCEDURE [dbo].[Dic_Objeto_Insert]
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Nombre varchar(500),
	@Dic_Modulo_Id varchar(17),
	@Numero int,
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;

--INSERT INTO [Dic_Objeto] (
--[Id], [Codigo], [Nombre], [Dic_Modulo_Id], [Numero], [Estado]) 
--VALUES (@Id, @Codigo, @Nombre, @Dic_Modulo_Id, @Numero, @Estado);

INSERT INTO [Dic_Objeto] (
[Id], [Codigo], [Nombre], [Dic_Modulo_Id], 
--[Numero], 
[Numero_old],
[Estado]) 
VALUES (
@Id, @Codigo, @Nombre, @Dic_Modulo_Id, 
--@Numero, 
-1,
@Estado);

	
SELECT Id, Codigo, Nombre, Dic_Modulo_Id, Numero, Estado FROM Dic_Objeto WHERE (Id = @Id)