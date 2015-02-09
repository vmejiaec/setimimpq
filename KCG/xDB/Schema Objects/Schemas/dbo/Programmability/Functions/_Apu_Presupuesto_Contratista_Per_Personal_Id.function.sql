CREATE FUNCTION [dbo].[_Apu_Presupuesto_Contratista_Per_Personal_Id]
(
	@p_Apu_Presupuesto_Id varchar(17)
)
RETURNS varchar(200)
BEGIN

    declare @v_Contratista_Per_Personal_Id varchar(17)

	select  @v_Contratista_Per_Personal_Id = 
            (
			 Select Contratista_Per_Personal_Id
             From  Apu_Presupuesto
             Where Id = @p_Apu_Presupuesto_Id
			)

    return  @v_Contratista_Per_Personal_Id

END

















