create FUNCTION [dbo].[_Apu_Categoria_Int_Empresa_Id]
(
	@p_Apu_Categoria_id varchar(17)
)
RETURNS varchar(17)
BEGIN
    
    declare @v_Int_Empresa_Id varchar(17)

	select  @v_Int_Empresa_Id = 
            (select Int_Empresa_Id 
             from  apu_categoria 
             where id = @p_Apu_Categoria_id)

    RETURN  @v_Int_Empresa_Id

END












