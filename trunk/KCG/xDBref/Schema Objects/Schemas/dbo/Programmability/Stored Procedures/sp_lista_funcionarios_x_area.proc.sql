
CREATE PROCEDURE [dbo].[sp_lista_funcionarios_x_area]
  @as_cod_institucion varchar(40),
  @as_cod_sucursal varchar(40),
  @as_cod_area varchar(7),
  @ai_num_reest integer                                                                                                                                                                                        
AS
                                                                                                                                                                                                                                                            
SELECT GDFUNCIONARIO_AREA.GD_CODIGO_PERSONA,                                                                                                                                                                                                                  
       GD_APELLIDOS+ ' '+ GD_NOMBRES                                                                                                                                                                                                                          
FROM GDFUNCIONARIO_AREA,                                                                                                                                                                                                                                      
     GDFUNCIONARIOS                                                                                                                                                                                                                                           
WHERE GDFUNCIONARIO_AREA.GD_CODIGO_PERSONA=GDFUNCIONARIOS.GD_CODIGO_PERSONA AND                                                                                                                                                                               
      GD_ESTADO='ACTIVO' AND                                                                                                                                                                                                                            
      GD_CODIGO_INSTITUCION= @as_cod_institucion AND
      GD_CODIGO_SUCURSAL   = @as_cod_sucursal AND
      GD_CODIGO_AREA      like @as_cod_area AND                                                                                                   
      GD_NUMERO_REESTRUCTURA = @ai_num_reest 
ORDER BY GD_APELLIDOS+ ' '+ GD_NOMBRES


