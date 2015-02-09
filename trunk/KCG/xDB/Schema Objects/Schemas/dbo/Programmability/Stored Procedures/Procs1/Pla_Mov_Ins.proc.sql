CREATE PROCEDURE [dbo].[Pla_Mov_Ins]
(
	@Codigo varchar(200),
	@Pla_Poa_Id int,
	@Pla_Doc_Id int,
	@Orden int,
	@Valor numeric(17, 4),
	@Estado char(3),
	@Tipo char(3)
)
AS
	SET NOCOUNT OFF;

-- Calcula el siguiente código en la tabla
declare @v_Codigo_Next varchar(50)
select @v_Codigo_Next = CONVERT(varchar, MAX(CONVERT(int,codigo))+1) from [Pla_Mov]

-- Calcula el orden de acuerdo con el Pla_Poa_Id
declare @v_Orden int
select @v_Orden = MAX(orden) + 1 from Pla_Mov where Pla_Poa_Id = @Pla_Poa_Id

select @v_Orden = ISNULL(@v_Orden,1)

INSERT INTO [Pla_Mov] ([Codigo]       , [Pla_Poa_Id], [Pla_Doc_Id], [Orden] , [Valor], [Estado], [Tipo]) 
               VALUES (@v_Codigo_Next , @Pla_Poa_Id , @Pla_Doc_Id , @v_Orden, @Valor , @Estado , @Tipo);
	
SELECT Id, Codigo, Pla_Poa_Id, Pla_Doc_Id, Orden, Valor, Estado, Tipo FROM Pla_Mov WHERE (Id = SCOPE_IDENTITY())