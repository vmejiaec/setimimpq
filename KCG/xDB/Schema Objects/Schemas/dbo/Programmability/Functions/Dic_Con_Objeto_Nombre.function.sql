CREATE FUNCTION [dbo].[Dic_Con_Objeto_Nombre]
(
	@p_Id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare 
             @v_Nombre varchar(500),
             @v_Dic_Contenedor_Id varchar(17),
             @v_Dic_Objeto_Id varchar(17),
             @v_Dic_Contenedor_Nombre varchar(500),
             @v_Dic_Objeto_Nombre varchar(500),
             @v_Orden int

    select @v_Dic_Contenedor_Id = dbo._Dic_Con_Objeto_Dic_Contenedor_Id(@p_Id);
    select @v_Dic_Objeto_Id = dbo._Dic_Con_Objeto_Dic_Objeto_Id(@p_Id);
    
    select @v_Dic_Contenedor_Nombre =  dbo._Dic_Contenedor_Nombre(@v_Dic_Contenedor_Id);
    select @v_Dic_Objeto_Nombre =  dbo._Dic_Objeto_Nombre(@v_Dic_Objeto_Id);
    
    select @v_Orden = dbo._Dic_Con_Objeto_Orden(@p_Id);

    set @v_Nombre =  @v_Dic_Contenedor_Nombre + 
                     ' - ' + 
                     @v_Dic_Objeto_Nombre + 
                     ' (' +
                     Convert(VARCHAR, @v_Orden) +
                      ') '
   
 RETURN  @v_Nombre

END