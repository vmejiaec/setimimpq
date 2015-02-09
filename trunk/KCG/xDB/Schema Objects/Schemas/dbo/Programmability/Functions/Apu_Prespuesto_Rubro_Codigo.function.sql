CREATE FUNCTION [dbo].[Apu_Prespuesto_Rubro_Codigo]
(
	@p_Apu_Prespuesto_Rubro_Id varchar(17)
)
RETURNS Varchar(200)
BEGIN
    
    declare @v_Codigo Varchar(200)

	select  @v_Codigo = 
            (select Codigo
             from  Apu_Presupuesto_Rubro
             where Id = @p_Apu_Prespuesto_Rubro_Id)

    RETURN  @v_Codigo

END










