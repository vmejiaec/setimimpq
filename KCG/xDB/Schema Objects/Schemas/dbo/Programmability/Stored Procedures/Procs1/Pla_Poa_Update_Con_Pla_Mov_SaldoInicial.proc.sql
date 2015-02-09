
CREATE PROCEDURE [dbo].[Pla_Poa_Update_Con_Pla_Mov_SaldoInicial]
(
	@Codigo varchar(200),
	@Pla_Tarea_Id int,
	@Pla_Partida_Id int,
	@Estado char(3),	
	@Original_Id int,
	@Original_Codigo varchar(200),
	@Original_Pla_Tarea_Id int,
	@Original_Pla_Partida_Id int,
	@Original_Estado char(3),	
	@Id int,
	@Valor_Inicial numeric(17,4)
)
AS
	SET NOCOUNT OFF;
	
Begin Transaction
Begin Try
--[O] INICIO
    Declare @v_Pla_Mov_Id int
    -- Actualizo Pla_Poa
	UPDATE [Pla_Poa] SET [Codigo] = @Codigo, [Pla_Tarea_Id] = @Pla_Tarea_Id, [Pla_Partida_Id] = @Pla_Partida_Id, [Estado] = @Estado 
	WHERE (([Id] = @Original_Id) AND ([Codigo] = @Original_Codigo) AND ([Pla_Tarea_Id] = @Original_Pla_Tarea_Id) AND ([Pla_Partida_Id] = @Original_Pla_Partida_Id) AND ([Estado] = @Original_Estado));
	-- Busco el primer movimiento del Poa
	select @v_Pla_Mov_Id = m.Id from Pla_Mov m where m.Pla_Poa_Id = @Id and m.Orden = 0
	-- Debuger
	--select @v_Pla_Mov_Id v_Pla_Mov_Id;
	-- Actualizo el primer movimiento del Poa
	update Pla_Mov set Valor = @Valor_Inicial where Id = @v_Pla_Mov_Id;
--[X] FIN
Commit Transaction
-- Debuger
--select m.Id mID, m.Codigo mCod, m.Estado mEst, m.Valor mVal from Pla_Mov m where m.Id = @v_Pla_Mov_Id;

SELECT Id, Codigo, Pla_Tarea_Id, Pla_Partida_Id, Estado FROM Pla_Poa WHERE (Id = @Id);
End Try
Begin Catch
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
end Catch;