CREATE FUNCTION [dbo].[Fis_Catalogo_CMO_Reajuste]
(
	@p_Fis_Catalogo_Id varchar(17),
	@p_Origen varchar(17),
	@p_Origen_Id varchar(17)
)
RETURNS numeric(17,3)
BEGIN
    
	declare
		@v_Valor numeric(17,3)

	begin
		if (@p_Origen = 'CAT')

			(select @v_Valor = Valor 
			from Fis_Catalogo_Categoria
			where Apu_Categoria_Id = @p_Origen_Id
			and Fis_Catalogo_Id = @p_Fis_Catalogo_Id)

		else if (@p_Origen = 'MAN')

			(select @v_Valor = Valor 
			from Fis_Catalogo_Mano_Obra
			where Apu_Mano_Obra_Id = @p_Origen_Id
			and Fis_Catalogo_Id = @p_Fis_Catalogo_Id)

	end

    RETURN convert( numeric(17,3),isnull(@v_valor,0))

END