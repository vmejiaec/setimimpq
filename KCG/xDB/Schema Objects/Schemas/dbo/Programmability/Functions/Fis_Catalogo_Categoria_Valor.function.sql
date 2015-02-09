CREATE FUNCTION [dbo].[Fis_Catalogo_Categoria_Valor]
(
	@p_Apu_Categoria_Id varchar(17),
	@p_Fis_Catalogo_Id varchar(17)
)
RETURNS numeric(17,4)
BEGIN
    
    declare @v_valor numeric(17,4)

	select  @v_valor = 
            (select Valor
             from Fis_Catalogo_Categoria
             where Apu_Categoria_Id = @p_Apu_Categoria_Id
			 and Fis_Catalogo_Id = @p_Fis_Catalogo_Id)

    RETURN isnull(@v_valor,0)

END