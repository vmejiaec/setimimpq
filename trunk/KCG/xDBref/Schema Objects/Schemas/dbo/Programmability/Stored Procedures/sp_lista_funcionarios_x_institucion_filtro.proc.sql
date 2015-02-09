
CREATE PROCEDURE [dbo].[sp_lista_funcionarios_x_institucion_filtro]                                                                                                                                                                                                                                               
  @as_cod_institucion varchar(40),
  @as_cod_sucursal varchar(40)
AS
SELECT GDFUNCIONARIO_AREA.GD_CODIGO_PERSONA,
       GD_APELLIDOS+ ' '+ GD_NOMBRES,      
       GD_CODIGO_AREA,
       GD_NUMERO_REESTRUCTURA
FROM GDFUNCIONARIO_AREA,
     GDFUNCIONARIOS     
WHERE GDFUNCIONARIO_AREA.GD_CODIGO_PERSONA=GDFUNCIONARIOS.GD_CODIGO_PERSONA AND                                                                                                                                                                                                                                                                                                                                                                                                         
      GD_CODIGO_INSTITUCION= @as_cod_institucion AND
      GD_CODIGO_SUCURSAL   = @as_cod_sucursal AND
      GD_ESTADO='ACTIVO' 
ORDER BY GD_APELLIDOS+ ' '+ GD_NOMBRES



