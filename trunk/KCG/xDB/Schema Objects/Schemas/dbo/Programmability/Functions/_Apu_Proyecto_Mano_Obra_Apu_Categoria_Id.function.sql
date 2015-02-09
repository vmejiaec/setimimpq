create FUNCTION [dbo].[_Apu_Proyecto_Mano_Obra_Apu_Categoria_Id]
(
	@p_apu_proyecto_id varchar(17),
    @p_apu_categoria_id varchar(17)
)
RETURNS varchar(17)
BEGIN
   declare 
          @v_apu_categoria_id varchar(17)

   select  @v_apu_categoria_id =
            (select apu_categoria_id
             from  apu_proyecto_mano_obra
             where apu_proyecto_id = @p_apu_proyecto_id
             and  apu_categoria_id = @p_apu_categoria_id)
                 
 return  @v_apu_categoria_id


END




