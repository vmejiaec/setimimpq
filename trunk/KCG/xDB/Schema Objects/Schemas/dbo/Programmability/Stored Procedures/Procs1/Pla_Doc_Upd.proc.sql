CREATE PROCEDURE [dbo].[Pla_Doc_Upd]
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
	@Pla_Tarea_Id int,
	@Original_Id int,
	@Original_Codigo varchar(200),
	@Original_Tipo char(3),
	@Original_Fecha_Solicita smalldatetime,
	@Original_Per_Personal_Id_Solicita varchar(17),
	@Original_Area_Codigo_Solicita varchar(500),
	@Original_Descripcion varchar(500),
	@Original_Estado char(3),
	@Original_Per_Personal_Id_Crea varchar(17),
	@Original_Per_Personal_Id_Modifica varchar(17),
	@Original_Valor_Solicita numeric(17, 4),
	@IsNull_Per_Personal_Id_Planifica Int,
	@Original_Per_Personal_Id_Planifica varchar(17),
	@Original_Esta_Planificada char(3),
	@IsNull_Per_Personal_Id_Contrata Int,
	@Original_Per_Personal_Id_Contrata varchar(17),
	@Original_Esta_Contratada char(3),
	@Original_PAC_Linea varchar(50),
	@Original_CPC_Codigo varchar(50),
	@Original_Fecha_Contrata smalldatetime,
	@Original_Fecha_Planifica smalldatetime,
	@Original_Cedula_Presup_Codigo varchar(100),
	@Original_Contrata_Desc varchar(200),
	--@IsNull_Pla_Tarea_Id Int,
	@Original_Pla_Tarea_Id int,
	@Id int
)
AS
	SET NOCOUNT OFF;

-- Convierte el valor de -1 en el valor null para el campo tipo int
if @Pla_Tarea_Id = 0
	select @Pla_Tarea_Id = null

if @Original_Pla_Tarea_Id = 0
begin
	select @Original_Pla_Tarea_Id = null
	--select @IsNull_Pla_Tarea_Id = 1
end 
	
UPDATE [Pla_Doc] SET [Codigo] = @Codigo, [Tipo] = @Tipo, [Fecha_Solicita] = @Fecha_Solicita, [Per_Personal_Id_Solicita] = @Per_Personal_Id_Solicita, [Area_Codigo_Solicita] = @Area_Codigo_Solicita, [Descripcion] = @Descripcion, [Estado] = @Estado, [Per_Personal_Id_Crea] = @Per_Personal_Id_Crea, [Per_Personal_Id_Modifica] = @Per_Personal_Id_Modifica, [Valor_Solicita] = @Valor_Solicita, [Per_Personal_Id_Planifica] = @Per_Personal_Id_Planifica, [Esta_Planificada] = @Esta_Planificada, [Per_Personal_Id_Contrata] = @Per_Personal_Id_Contrata, [Esta_Contratada] = @Esta_Contratada, [PAC_Linea] = @PAC_Linea, [CPC_Codigo] = @CPC_Codigo, [Fecha_Contrata] = @Fecha_Contrata, [Fecha_Planifica] = @Fecha_Planifica, [Cedula_Presup_Codigo] = @Cedula_Presup_Codigo, [Contrata_Desc] = @Contrata_Desc, 
[Pla_Tarea_Id] = @Pla_Tarea_Id 
WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Tipo] = @Original_Tipo) AND ([Fecha_Solicita] = @Original_Fecha_Solicita) 
AND ([Per_Personal_Id_Solicita] = @Original_Per_Personal_Id_Solicita) AND ([Area_Codigo_Solicita] = @Original_Area_Codigo_Solicita) AND ([Descripcion] = @Original_Descripcion) AND ([Estado] = @Original_Estado) AND ([Per_Personal_Id_Crea] = @Original_Per_Personal_Id_Crea) AND ([Per_Personal_Id_Modifica] = @Original_Per_Personal_Id_Modifica) AND ([Valor_Solicita] = @Original_Valor_Solicita) AND ((@IsNull_Per_Personal_Id_Planifica = 1 AND [Per_Personal_Id_Planifica] IS NULL) OR ([Per_Personal_Id_Planifica] = @Original_Per_Personal_Id_Planifica)) AND ([Esta_Planificada] = @Original_Esta_Planificada) AND ((@IsNull_Per_Personal_Id_Contrata = 1 AND [Per_Personal_Id_Contrata] IS NULL) OR ([Per_Personal_Id_Contrata] = @Original_Per_Personal_Id_Contrata)) AND ([Esta_Contratada] = @Original_Esta_Contratada) AND ([PAC_Linea] = @Original_PAC_Linea) AND ([CPC_Codigo] = @Original_CPC_Codigo) AND ([Fecha_Contrata] = @Original_Fecha_Contrata) AND ([Fecha_Planifica] = @Original_Fecha_Planifica) AND ([Cedula_Presup_Codigo] = @Original_Cedula_Presup_Codigo) AND ([Contrata_Desc] = @Original_Contrata_Desc) 
--AND 
-- (
--  --(@IsNull_Pla_Tarea_Id = 1 AND [Pla_Tarea_Id] IS NULL) OR 
--  ([Pla_Tarea_Id] = @Original_Pla_Tarea_Id)
-- )
);
	
SELECT Id, Codigo, Tipo, Fecha_Solicita, Per_Personal_Id_Solicita, Area_Codigo_Solicita, Descripcion, Estado, Per_Personal_Id_Crea, Per_Personal_Id_Modifica, Valor_Solicita, Per_Personal_Id_Planifica, Esta_Planificada, Per_Personal_Id_Contrata, Esta_Contratada, PAC_Linea, CPC_Codigo, Fecha_Contrata, Fecha_Planifica, Cedula_Presup_Codigo, Contrata_Desc, Pla_Tarea_Id FROM Pla_Doc WHERE (Id = @Id)