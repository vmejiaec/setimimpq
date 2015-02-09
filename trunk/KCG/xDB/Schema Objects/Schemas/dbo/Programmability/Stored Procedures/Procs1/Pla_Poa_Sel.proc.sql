
CREATE PROCEDURE [dbo].[Pla_Poa_Sel]
AS
	SET NOCOUNT ON;
SELECT        
	Id, 
	Codigo, 
	Pla_Tarea_Id, 
	Pla_Partida_Id,
	Estado,
	-- Tarea
	(select t.Codigo from Pla_Tarea t where t.Id = Pla_Tarea_Id) Pla_Tarea_Codigo,
	(select t.Nombre from Pla_Tarea t where t.Id = Pla_Tarea_Id) Pla_Tarea_Nombre,
	-- Cuenta
	(select t.Pla_Cta_Id from Pla_Tarea t where t.Id = Pla_Tarea_Id) Pla_Cta_Id,
	(Select c.Codigo from Pla_Cta c where c.Id = 
		(select t.Pla_Cta_Id from Pla_Tarea t where t.Id = Pla_Tarea_Id)
	) Pla_Cta_Codigo,
	(Select c.Nombre from Pla_Cta c where c.Id = 
		(select t.Pla_Cta_Id from Pla_Tarea t where t.Id = Pla_Tarea_Id)
	) Pla_Cta_Nombre,
    -- Partida
	(select p.Codigo from Pla_Partida p where p.Id = Pla_Partida_Id) Pla_Partida_Codigo,
	(select p.Nombre from Pla_Partida p where p.Id = Pla_Partida_Id) Pla_Partida_Nombre,
	-- Movimiento inicial
	(select isnull(SUM(m.Valor),0) from Pla_Mov m where m.Pla_Poa_Id = poa.Id and Orden = 0) Valor_Inicial,
	-- Suma de todos los movimientos
	dbo.[Pla_Mov_SumaMovs_ByPla_Poa_Id](Id) Valor_Suma,
	-- Suma de todos los movimientos de reasignacion del poa
	dbo.Pla_Mov_SumaMovsReasignacion_ByPla_Poa_Id(Id) Valor_Suma_Movs_Reasignacion,
	-- Suma de los movimientos del tipo CER certificacion
	(select isnull(SUM(m.Valor),0) from Pla_Mov m where m.Pla_Poa_Id = poa.Id 
		and ( select doc.Tipo from Pla_Doc doc  where doc.Id = m.Pla_Doc_Id ) = 'CER' ) Valor_Suma_Certificados
FROM            
	Pla_Poa poa
	