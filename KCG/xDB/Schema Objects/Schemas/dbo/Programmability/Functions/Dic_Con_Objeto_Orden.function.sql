CREATE FUNCTION [dbo].[Dic_Con_Objeto_Orden]
(
	@p_Dic_Con_Objeto_Id varchar(17)
)
RETURNS int
BEGIN
    
    declare @v_Orden int

	select  @v_Orden = 
            (select Orden 
             from  Dic_Con_Objeto 
             where Id = @p_Dic_Con_Objeto_Id)

    RETURN  @v_Orden

END

