CREATE FUNCTION [dbo].[Per_Personal_Usuario]
(
	@p_Per_Personal_Id VARCHAR(17)
)
RETURNS VARCHAR(5000)
BEGIN
    
    DECLARE @v_Concatenados VARCHAR(5000), @v_Nombre VARCHAR(500), @v_Guion VARCHAR(4)
	--Inicializar Variables
	SET @v_Concatenados	= ' '
	SET @v_Guion = ''

	DECLARE C_Nombres CURSOR FOR	
	SELECT Nombre 
	FROM Int_Usuario
    WHERE Per_Personal_Id = @p_Per_Personal_Id
	
	OPEN C_Nombres
		FETCH NEXT FROM C_Nombres 
		INTO @v_Nombre
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		--Se arma la Cadena que va a devolver la función
		SET @v_Concatenados = @v_Concatenados + @v_Guion + ltrim(rtrim(@v_Nombre));
		SET @v_Guion = ' - '
		FETCH NEXT FROM C_Nombres 
		INTO @v_Nombre
	END

	CLOSE C_Nombres	
    RETURN  @v_Concatenados
END