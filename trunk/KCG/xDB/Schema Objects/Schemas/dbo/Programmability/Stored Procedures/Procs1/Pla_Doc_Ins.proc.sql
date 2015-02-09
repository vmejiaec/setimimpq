CREATE PROCEDURE [dbo].[Pla_Doc_Ins]
(
	@Codigo varchar(200),
	@Tipo char(3),
	@Fecha_Solicita smalldatetime,
	@Per_Personal_Id_Solicita varchar(17),
	@Area_Codigo_Solicita varchar(500),
	@Descripcion varchar(500),
	@Estado char(3),
	@Per_Personal_Id_Crea varchar(17),
	@Per_Personal_Id_Modifica varchar(17),
	@Valor_Solicita numeric(17, 4),
	@Per_Personal_Id_Planifica varchar(17),
	@Esta_Planificada char(3),
	@Per_Personal_Id_Contrata varchar(17),
	@Esta_Contratada char(3),
	@PAC_Linea varchar(50),
	@CPC_Codigo varchar(50),
	@Fecha_Contrata smalldatetime,
	@Fecha_Planifica smalldatetime,
	@Cedula_Presup_Codigo varchar(100),
	@Contrata_Desc varchar(200),
	@Pla_Tarea_Id int
)
AS
	SET NOCOUNT OFF;
	
-- Calcula el siguiente registro en campo el Código
declare @v_Codigo_Next varchar(50)

select @v_Codigo_Next = CONVERT(varchar, MAX(CONVERT(int,codigo))+1) from [Pla_Doc]

if @v_Codigo_Next < 0 
	select @v_Codigo_Next = 1

-- Se convierte el -1 en null para el campo tipo int
if @Pla_Tarea_Id = 0
	select @Pla_Tarea_Id = null
	
INSERT INTO [Pla_Doc] 
       ([Codigo]      , [Tipo], [Fecha_Solicita], [Per_Personal_Id_Solicita], [Area_Codigo_Solicita], [Descripcion], [Estado], [Per_Personal_Id_Crea], [Per_Personal_Id_Modifica], [Valor_Solicita], [Per_Personal_Id_Planifica], [Esta_Planificada], [Per_Personal_Id_Contrata], [Esta_Contratada], [PAC_Linea], [CPC_Codigo], [Fecha_Contrata], [Fecha_Planifica], [Cedula_Presup_Codigo], [Contrata_Desc], [Pla_Tarea_Id]) 
VALUES (@v_Codigo_Next, @Tipo , @Fecha_Solicita , @Per_Personal_Id_Solicita , @Area_Codigo_Solicita , @Descripcion , @Estado, @Per_Personal_Id_Crea, @Per_Personal_Id_Modifica, @Valor_Solicita, @Per_Personal_Id_Planifica, @Esta_Planificada, @Per_Personal_Id_Contrata, @Esta_Contratada, @PAC_Linea, @CPC_Codigo, @Fecha_Contrata, @Fecha_Planifica, @Cedula_Presup_Codigo, @Contrata_Desc, @Pla_Tarea_Id);
	
SELECT Id, Codigo, Tipo, Fecha_Solicita, Per_Personal_Id_Solicita, Area_Codigo_Solicita, Descripcion, Estado, Per_Personal_Id_Crea, Per_Personal_Id_Modifica, Valor_Solicita, Per_Personal_Id_Planifica, Esta_Planificada, Per_Personal_Id_Contrata, Esta_Contratada, PAC_Linea, CPC_Codigo, Fecha_Contrata, Fecha_Planifica, Cedula_Presup_Codigo, Contrata_Desc, Pla_Tarea_Id FROM Pla_Doc WHERE (Id = SCOPE_IDENTITY())