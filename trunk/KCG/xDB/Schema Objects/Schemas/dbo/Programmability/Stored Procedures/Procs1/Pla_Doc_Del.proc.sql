CREATE PROCEDURE [dbo].[Pla_Doc_Del]
(
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
	@Original_Pla_Tarea_Id int
)
AS
	SET NOCOUNT OFF;

-- Se convierte el valor de -1 a null para el campo tipo int
	if @Original_Pla_Tarea_Id = 0
	begin
		select @Original_Pla_Tarea_Id = null
		--select @IsNull_Pla_Tarea_Id = 1
	end

DELETE FROM [Pla_Doc] WHERE (
  ([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Tipo] = @Original_Tipo) AND ([Fecha_Solicita] = @Original_Fecha_Solicita) AND ([Per_Personal_Id_Solicita] = @Original_Per_Personal_Id_Solicita) AND ([Area_Codigo_Solicita] = @Original_Area_Codigo_Solicita) AND ([Descripcion] = @Original_Descripcion) AND ([Estado] = @Original_Estado) AND ([Per_Personal_Id_Crea] = @Original_Per_Personal_Id_Crea) AND ([Per_Personal_Id_Modifica] = @Original_Per_Personal_Id_Modifica) AND ([Valor_Solicita] = @Original_Valor_Solicita) AND ((@IsNull_Per_Personal_Id_Planifica = 1 AND [Per_Personal_Id_Planifica] IS NULL) OR ([Per_Personal_Id_Planifica] = @Original_Per_Personal_Id_Planifica)) AND ([Esta_Planificada] = @Original_Esta_Planificada) AND ((@IsNull_Per_Personal_Id_Contrata = 1 AND [Per_Personal_Id_Contrata] IS NULL) OR ([Per_Personal_Id_Contrata] = @Original_Per_Personal_Id_Contrata)) AND ([Esta_Contratada] = @Original_Esta_Contratada) AND ([PAC_Linea] = @Original_PAC_Linea) AND ([CPC_Codigo] = @Original_CPC_Codigo) AND ([Fecha_Contrata] = @Original_Fecha_Contrata) AND ([Fecha_Planifica] = @Original_Fecha_Planifica) AND ([Cedula_Presup_Codigo] = @Original_Cedula_Presup_Codigo) AND ([Contrata_Desc] = @Original_Contrata_Desc) 
--AND 
--  (
  --(@IsNull_Pla_Tarea_Id = 1 AND [Pla_Tarea_Id] IS NULL) OR 
--  ([Pla_Tarea_Id] = @Original_Pla_Tarea_Id)
--  )
)