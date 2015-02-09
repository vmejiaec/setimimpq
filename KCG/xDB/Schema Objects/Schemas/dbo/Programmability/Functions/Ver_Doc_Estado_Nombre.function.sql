

CREATE FUNCTION [dbo].[Ver_Doc_Estado_Nombre]
(
	@p_Ver_Version_Id varchar(17),
    @p_Apr_Doc_Estado_Id  varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare @v_Nombre varchar(500)

	select  @v_Nombre = 
            (select Nombre 
             from  Ver_Doc_Estado 
             where Ver_Version_Id = @p_Ver_Version_Id
              and Apr_Doc_Estado_Id = @p_Apr_Doc_Estado_Id)

    RETURN  @v_Nombre

END








