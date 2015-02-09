

CREATE FUNCTION [dbo].[Dic_Objeto_Codigo]
(
	@p_dic_Objeto_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select Codigo 
             from  Dic_Objeto 
             where Id = @p_dic_Objeto_id)

    RETURN  @v_codigo

END












