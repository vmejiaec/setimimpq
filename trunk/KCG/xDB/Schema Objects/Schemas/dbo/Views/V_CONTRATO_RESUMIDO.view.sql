CREATE VIEW dbo.V_CONTRATO_RESUMIDO
AS
SELECT TOP 1
  1 PROG_ID,
  3 TIPC_ID,
  8 UBI_ID,
  195 PROY_ID,
  Id SPROY_ID,
  1 FRM_ID,
  '2014' FRM_PERIODO,
  1 CTO_ID,
  1 CTOT_ID,
  'CISNEROS BAQUERO EDISON ADRIAN' CTO_ASESOR,
  Fecha_Solicita CTO_FI_INVITA,
  Fecha_Solicita CTO_FI_ENTREGA,
  0 CTO_I_AMPLIACION,
  Fecha_Solicita CTO_FI_RECEPCION,
  Fecha_Solicita CTO_FC_ENTREGA,
  Fecha_Solicita CTO_FC_INFORME,
  Fecha_Solicita CTO_FC_RECEPCION,
  Fecha_Solicita CTO_FECHA_ADJUDICA,
  Fecha_Contrata CTO_FECHA,
  Valor_Solicita CTO_MONTO,
  30.00 CTO_ANTICIPO,
  120 CTO_PLAZO,
  CONVERT(BIT, 1) CTO_ADJUDICADO,
  Pla_Tarea_Id Codigo_Institucional

FROM Pla_Doc
WHERE Pla_Tarea_Id = 7

