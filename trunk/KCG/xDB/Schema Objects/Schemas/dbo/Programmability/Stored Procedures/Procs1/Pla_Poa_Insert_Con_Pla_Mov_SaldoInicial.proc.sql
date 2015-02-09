
CREATE PROCEDURE [dbo].[Pla_Poa_Insert_Con_Pla_Mov_SaldoInicial]
(
	@Codigo varchar(200),
	@Pla_Tarea_Id int,
	@Pla_Partida_Id int,
	@Valor_Inicial numeric(17,4),
	@Estado char(3)
)
AS
	SET NOCOUNT OFF;

Begin Transaction
begin try
--[O] INICIO
	declare @v_Pla_Poa_Id int,
			@v_Pla_Mov_Id int,
			@v_Pla_Cta_Anio varchar(4),
			@v_Pla_Cta_Id int,
			@v_Pla_Doc_Id int,
			@v_Pla_Mov_Codigo_Next varchar(20)
	-- Consulta el año correspondiente a la tarea
	select @v_Pla_Cta_Id = t.Pla_Cta_Id from Pla_Tarea t where t.Id = @Pla_Tarea_Id
	select @v_Pla_Cta_Anio = c.Anio from Pla_Cta c where c.Id = @v_Pla_Cta_Id
	-- Consulta el Pla_Doc del tipo ASI (Saldo Inicial) y del año 
	-- correspondiente a la tarea 
	select @v_Pla_Doc_Id = d.Id from Pla_Doc d where d.Codigo = '-'+@v_Pla_Cta_Anio and d.Tipo = 'ASI'
	-- Si no existe el documento lo va a CREAR
	if @v_Pla_Doc_Id is null
	begin
		declare @v_Pla_Doc_Codigo_Next varchar(50)	
		select @v_Pla_Doc_Codigo_Next = '-' + @v_Pla_Cta_Anio

		INSERT INTO [Pla_Doc] 
					([Codigo] , [Tipo], [Fecha_Solicita], [Per_Personal_Id_Solicita], [Area_Codigo_Solicita], 
					[Descripcion], [Estado], [Per_Personal_Id_Crea], [Per_Personal_Id_Modifica], 
					[Valor_Solicita], [Per_Personal_Id_Planifica], [Esta_Planificada], [Per_Personal_Id_Contrata], 
					[Esta_Contratada], [PAC_Linea], [CPC_Codigo], [Fecha_Contrata], [Fecha_Planifica],
					Cedula_Presup_Codigo, Contrata_Desc) 
			VALUES (@v_Pla_Doc_Codigo_Next, 
				   'ASI', --Tipo , 
				   GETDATE(), --[Fecha_Solicita] 
				   '1', --@Per_Personal_Id_Solicita, 
				   '',  --@Area_Codigo_Solicita, 
				   'Movimiento Inicial', --@Descripcion, 
				   'PEN', --@Estado, 
				   '1',   --@Per_Personal_Id_Crea, 
				   '1',   --@Per_Personal_Id_Modifica, 
				   @Valor_Inicial, --@Valor_Solicita, 
				   '1',   --@Per_Personal_Id_Planifica, 
				   'SIP', --@Esta_Planificada, 
				   '1',   --@Per_Personal_Id_Contrata, 
				   'SIC', --@Esta_Contratada, 
				   '',    --@PAC_Linea, 
				   '',    --@CPC_Codigo, 
				   GETDATE(),  --@Fecha_Contrata, 
				   GETDATE(),  --@Fecha_Planifica,
				   '',         --Cedula_Presup_Codigo
				   ''          --Contrata_Desc
				   );
		--
		select @v_Pla_Doc_Id = SCOPE_IDENTITY();
		--select @v_Pla_Doc_Id v_Pla_Doc_Id
	end 
	
	-- Debuger
	--select @v_Pla_Cta_Id v_Pla_Cta_Id, @v_Pla_Cta_Anio v_Pla_Cta_Anio, @v_Pla_Doc_Id v_Pla_Doc_Id
	-- Inserta POA y consulta el id generado
	INSERT INTO [Pla_Poa] ([Codigo], [Pla_Tarea_Id], [Pla_Partida_Id], [Estado]) 
		           VALUES (@Codigo , @Pla_Tarea_Id , @Pla_Partida_Id , @Estado);
	select @v_Pla_Poa_Id = SCOPE_IDENTITY();
	-- Debuger
	--select @v_Pla_Poa_Id v_Pla_Poa_Id 
	-- Inserta el Movimiento del registro con el saldo inicial	
	INSERT INTO [Pla_Mov] ([Codigo], [Pla_Poa_Id] , [Pla_Doc_Id] , [Orden], [Valor]       , [Estado], Tipo) 
				   VALUES (@Codigo , @v_Pla_Poa_Id, @v_Pla_Doc_Id, 0      , @Valor_Inicial, 'PEN', 'CRE');
	select @v_Pla_Mov_Id = SCOPE_IDENTITY();
	-- Debuger
	--select @v_Pla_Mov_Id v_Pla_Mov_Id 
--[X] FIN
Commit Transaction
SELECT Id, Codigo, Pla_Tarea_Id, Pla_Partida_Id, Estado FROM Pla_Poa WHERE (Id = @v_Pla_Poa_Id )
end try
begin catch
Rollback Transaction
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT @ErrorMessage = ERROR_MESSAGE(),
           @ErrorSeverity = ERROR_SEVERITY(),
           @ErrorState = ERROR_STATE();

    RAISERROR (@ErrorMessage, -- Message text.
               @ErrorSeverity, -- Severity.
               @ErrorState -- State.
               );
end catch;