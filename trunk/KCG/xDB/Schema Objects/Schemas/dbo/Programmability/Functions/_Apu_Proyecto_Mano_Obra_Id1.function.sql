CREATE FUNCTION [dbo].[_Apu_Proyecto_Mano_Obra_Id1]
(
	@p_apu_proyecto_id varchar(17),
    @p_apu_mano_obra_Id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_Id varchar(17)
              
	select  @v_Id = 
            (select id 
             from  apu_proyecto_mano_obra
             where apu_proyecto_id = @p_apu_proyecto_id
             and apu_mano_obra_id = @p_apu_mano_obra_id)

    RETURN  @v_Id

END



