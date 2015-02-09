CREATE PROCEDURE [dbo].[Pla_Tarea_Ins]
(
	@Codigo varchar(200),
	@Pla_Cta_Id int,
	@Nombre varchar(500),
	@Fecha_Ini smalldatetime,
	@Fecha_Fin smalldatetime,
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;

-- Calcula el siguiente código 
declare @v_Codigo_Next varchar(50)

select @v_Codigo_Next = CONVERT(varchar, MAX(CONVERT(int,codigo))+1) from Pla_Tarea

IF @v_Codigo_Next is null
begin
	select @v_Codigo_Next = 1
end

-- valida que la cuenta sea del tipo ACT porque es el cuarto nivel

declare @v_cta_codigo varchar(50)

select @v_cta_codigo = cta.Codigo from Pla_Cta cta where cta.Id = @Pla_Cta_Id

if LEN(@v_cta_codigo) <> 12
begin
	RAISERROR (N'La cuenta %s no es de nivel %d.', -- Message text.
           16, -- Severity,
           1, -- State,
           N'ingresada', -- First argument.
           4); -- Second argument.	
end 
else
begin
	-- Inserta
	INSERT INTO [Pla_Tarea] ([Codigo], [Pla_Cta_Id], [Nombre], [Fecha_Ini], [Fecha_Fin], [Estado]) 
	VALUES (@v_Codigo_Next, @Pla_Cta_Id, @Nombre, @Fecha_Ini, @Fecha_Fin, @Estado);
end
	
SELECT Id, Codigo, Pla_Cta_Id, Nombre, Fecha_Ini, Fecha_Fin, Estado FROM Pla_Tarea WHERE (Id = SCOPE_IDENTITY())