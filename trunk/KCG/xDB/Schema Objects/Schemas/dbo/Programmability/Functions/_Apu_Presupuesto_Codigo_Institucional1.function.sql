CREATE FUNCTION [dbo].[_Apu_Presupuesto_Codigo_Institucional1]
(
	@p_Apu_Presupuesto_Id varchar(17)
)
RETURNS varchar(200)
BEGIN

    Declare 
		@v_Apu_Origen_Id varchar(17),
		@v_Origen varchar(3),
		@v_Codigo_Institucional varchar(200)
	
	Select @v_Apu_Origen_Id = Apu_Origen_Id,
		   @v_Origen = Origen
	From Apu_Presupuesto
	Where Id = @p_Apu_Presupuesto_Id;

	Set @v_Codigo_Institucional =
		dbo._Apu_Presupuesto_Codigo_Institucional (@v_Origen, @v_Apu_Origen_Id)
	
    Return  @v_Codigo_Institucional;

END
















