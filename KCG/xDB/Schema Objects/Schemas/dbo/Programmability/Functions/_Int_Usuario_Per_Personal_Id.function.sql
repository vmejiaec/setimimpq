create FUNCTION [dbo].[_Int_Usuario_Per_Personal_Id]
(
	@p_int_usuario_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_per_personal_id varchar(17)

	select  @v_per_personal_id = 
            (select per_personal_id 
             from  int_usuario 
             where id = @p_int_usuario_id)

    RETURN  @v_per_personal_id

END








