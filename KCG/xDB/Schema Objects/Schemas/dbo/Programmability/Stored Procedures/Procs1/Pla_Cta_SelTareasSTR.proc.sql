
create PROCEDURE [dbo].[Pla_Cta_SelTareasSTR]
(@p_Anio varchar(4),
 @p_Pla_Cta_Id int,
 @p_Fecha smalldatetime)
AS
begin
	declare @v_t_Codigo varchar(500),
			@v_Res varchar(500);

	set @v_Res = 'Tareas: ';

	declare cur_Pla_Tarea cursor for
		select t.Codigo
		from Pla_Tarea t
		where t.Pla_Cta_Id = @p_Pla_Cta_Id;

	open cur_Pla_Tarea;

	fetch next from cur_Pla_Tarea
	into @v_t_Codigo;

	while @@FETCH_STATUS = 0
		begin
			set @v_Res = @v_Res + '-' + @v_t_Codigo;
			
			fetch next from cur_Pla_Tarea
			into @v_t_Codigo;
		end
		
	close cur_Pla_Tarea;
	deallocate cur_Pla_Tarea;
	
	select @v_Res as Tareas;
	
end