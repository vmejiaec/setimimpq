CREATE FUNCTION [dbo].[_Apu_Proyecto_Categoria_Id]
(
	@p_apu_proyecto_id varchar(17),	
	@p_apu_categoria_id varchar(17)

)
RETURNS varchar(17)
BEGIN
    
    declare @v_Id varchar(17)

	select  @v_Id = 
            (select Id 
             from  apu_proyecto_categoria
             where Apu_Proyecto_Id = @p_apu_proyecto_id
			 and Apu_Categoria_Id=@p_apu_categoria_id)

    RETURN  @v_Id

END

















