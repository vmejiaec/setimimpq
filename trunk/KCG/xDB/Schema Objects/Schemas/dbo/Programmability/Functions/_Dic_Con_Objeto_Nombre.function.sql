create FUNCTION [dbo].[_Dic_Con_Objeto_Nombre]
(
	@p_id varchar(17)
)
RETURNS varchar(500)
BEGIN
    
    declare 
             @v_nombre varchar(500),
             @v_dic_contenedor_id varchar(17),
             @v_dic_objeto_id varchar(17),
             @v_dic_contenedor_nombre varchar(500),
             @v_dic_objeto_nombre varchar(500),
             @v_Orden int

    exec @v_dic_contenedor_id = _Dic_Con_Objeto_Dic_Contenedor_Id @p_id
    exec @v_dic_objeto_id = _Dic_Con_Objeto_Dic_Objeto_Id @p_id
    
    exec @v_dic_contenedor_nombre =  _Dic_Contenedor_Nombre @v_dic_Contenedor_id
    exec @v_dic_objeto_nombre =  _Dic_Objeto_Nombre @v_dic_Objeto_id
    
    exec @v_orden = _dic_Con_Objeto_Orden  @p_id

    set @v_nombre =  @v_dic_contenedor_nombre + 
                     ' - ' + 
                     @v_dic_objeto_nombre + 
                     ' (' +
                     Convert(VARCHAR, @v_orden) +
                      ') '
   
 RETURN  @v_nombre

END










