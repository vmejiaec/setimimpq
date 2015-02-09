CREATE FUNCTION [dbo].[Dic_Rotulo_Codigo]
(
	@p_dic_rotulo_id varchar(17)
)
RETURNS varchar(200)
BEGIN
    
    declare @v_codigo varchar(200)

	select  @v_codigo = 
            (select Codigo 
             from  Dic_Rotulo 
             where Id = @p_dic_rotulo_id)

    RETURN  @v_codigo

END












