
CREATE PROCEDURE [dbo].[Pla_Poa_Del_Con_Pla_Mov_y_Pla_Doc]
(
	@Original_Id int,
	@Original_Codigo varchar(200),
	@Original_Pla_Tarea_Id int,
	@Original_Pla_Partida_Id int,
	@Original_Estado char(3)
)
AS
Begin Transaction
begin try
	declare @v_Pla_Mov_Count int,
			@v_Pla_Doc_Id int

	SELECT @v_Pla_Mov_Count = COUNT(*) FROM Pla_Mov
	where Pla_Poa_Id = @Original_Id

	if @v_Pla_Mov_Count > 1 
	begin
	  RAISERROR ('No se puede borrar la partida asociada porque la cuenta ya tiene movimientos',16,1);
	end

	delete from Pla_Mov where Pla_Poa_Id = @Original_Id
	
	DELETE FROM Pla_Poa WHERE  Id = @Original_Id
	
Commit Transaction

    select 1 res
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