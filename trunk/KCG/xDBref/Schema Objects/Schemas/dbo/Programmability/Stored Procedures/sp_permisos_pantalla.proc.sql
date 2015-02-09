
create proc [dbo].[sp_permisos_pantalla] (
	 @cod_persona      varchar(20)
	,@as_opcion    varchar(60) 
	,@as_institucion varchar(40)
	,@as_sucursal varchar(40)

)
as

DECLARE @ls_grupo   varchar(4)
DECLARE @ls_opcion   varchar(8)
DECLARE @ls_sel varchar(2)
DECLARE @ls_upd varchar(2)
DECLARE @ls_ins varchar(2)
DECLARE @ls_del varchar(2)

 
	SELECT SG_SELECT,
		SG_INSERT,
		SG_UPDATE,
		SG_DELETE
		,SGPERMISOS.SG_CODIGO_GRUPO
		,SG_CODIGO_OPCION
	 INTO #permisos1
	FROM   SGMIEMBROS
		,SGPERMISOS
	WHERE SGMIEMBROS.SG_CODIGO_GRUPO = SGPERMISOS.SG_CODIGO_GRUPO
		AND SG_CODIGO_OPCION = @as_opcion 
		and SGPERMISOS.GD_CODIGO_INSTITUCION = @as_institucion
		AND SGPERMISOS.GD_CODIGO_SUCURSAL = @as_sucursal
		AND (SGMIEMBROS.GD_CODIGO_PERSONA IN (
					SELECT GDFUNCIONARIO_AREA.GD_CODIGO_PERSONA
					FROM   GDFUNCIONARIO_AREA
					WHERE GDFUNCIONARIO_AREA.GD_CODIGO_PERSONA = @cod_persona and
						GDFUNCIONARIO_AREA.GD_CODIGO_INSTITUCION = @as_institucion and
						GDFUNCIONARIO_AREA.GD_CODIGO_SUCURSAL =  @as_sucursal))

select TOP 1 * INTO #permisos from #permisos1
DECLARE permisos_cursor CURSOR FOR
SELECT * FROM #permisos1
OPEN permisos_cursor 
FETCH NEXT FROM permisos_cursor
INTO @ls_sel, @ls_ins, @ls_upd, @ls_del, @ls_grupo, @ls_opcion

WHILE @@FETCH_STATUS = 0
BEGIN
	IF @ls_sel = 'SI' 
	BEGIN
		UPDATE #permisos SET SG_SELECT = @ls_sel
	END	
	IF @ls_ins = 'SI' 
	BEGIN
		UPDATE #permisos SET SG_INSERT = @ls_ins
	END	
	IF @ls_upd = 'SI' 
	BEGIN
		UPDATE #permisos SET SG_UPDATE = @ls_upd
	END	
	IF @ls_del = 'SI' 
	BEGIN
		UPDATE #permisos SET SG_DELETE = @ls_del
	END	
	FETCH NEXT FROM permisos_cursor
	INTO @ls_sel, @ls_ins, @ls_upd, @ls_del, @ls_grupo, @ls_opcion
END

select *  FROM #permisos 
drop table #permisos
drop table #permisos1



