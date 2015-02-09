CREATE FUNCTION [dbo].[Fis_Catalogo_CMO_Valor]
(
	@p_Apu_Categoria_Id varchar(17),
	@p_Fis_Catalogo_Id varchar(17),
	@p_valor numeric(17,2)
)
RETURNS numeric(17,2)
BEGIN
    
    declare @v_valor numeric(17,2)
	
	begin
		if(@p_Apu_Categoria_Id is not null)
			select @v_valor = (select Valor 
							   from Fis_Catalogo_Categoria
							   where Apu_Categoria_Id = @p_Apu_Categoria_Id
							   and Fis_Catalogo_Id = @p_Fis_Catalogo_Id)
		else
			set @v_valor = @p_valor
	end

    RETURN isnull(@v_valor,0)

END