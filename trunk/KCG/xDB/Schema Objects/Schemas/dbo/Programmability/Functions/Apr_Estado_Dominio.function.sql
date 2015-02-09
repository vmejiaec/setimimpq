

CREATE FUNCTION [dbo].[Apr_Estado_Dominio]
(
	@p_Apr_Estado_Id varchar(17)
)
RETURNS char(3)
BEGIN
    
    declare @v_Dominio char(3)

	select  @v_Dominio = 
            (select Dominio 
             from  Apr_Estado 
             where Id = @p_Apr_Estado_Id)

    RETURN  @v_Dominio
END


