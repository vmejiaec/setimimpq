


CREATE FUNCTION [dbo].[Seg_Rol_Usuario_Nombre1]
(
    @p_Seg_Rol_Id varchar(17),
	@p_Int_Usuario_Id varchar(17)
)
RETURNS varchar(2000)
BEGIN
    declare @v_Id1 varchar(17),
			@v_Id2 varchar(17),
			@v_Rol_Usuario_Nombre varchar(500),			
			@v_Nombre1 varchar(500),
			@v_Nombre2 varchar(500)

    set @v_Id1 =  @p_Seg_Rol_Id
	set @v_Id2 = @p_Int_Usuario_Id	 
    set @v_Rol_Usuario_Nombre = ''
         
		  (select @v_Nombre1 = Nombre                  
          from  Seg_Rol
          where Id = @v_Id1)
           
         (select @v_Nombre2 = Nombre                 
          from  Int_Usuario
          where Id = @v_Id2)

       set @v_Rol_Usuario_Nombre = @v_Nombre1 +  ' - '  + @v_Nombre2       
        	
    RETURN  @v_Rol_Usuario_Nombre

END


