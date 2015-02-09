
CREATE view [dbo].[v_Apu_Proyecto_Rubro] as
SELECT     
	Id, 
	Codigo, 
	Apu_Proyecto_Id, 
	Apu_Rubro_Id, 
	Cantidad, 
	Rendimiento_Mano_Obra, 
	Rendimiento_Equipo, 
	Apu_Subtitulo_Id, 
	Estado, 
    dbo._Apu_Proyecto_Codigo(Apu_Proyecto_Id) AS Apu_Proyecto_Codigo, 
    dbo._apu_Proyecto_Nombre(Apu_Proyecto_Id) AS Apu_Proyecto_Nombre, 
    dbo._Apu_Proyecto_Costo_Total(Apu_Proyecto_Id) AS Apu_Proyecto_Costo_Total, 
    dbo._Apu_Subtitulo_Codigo(Apu_Subtitulo_Id) AS Apu_Subtitulo_Codigo, 
    dbo._Apu_SubTitulo_Nombre(Apu_Subtitulo_Id) AS Apu_Subtitulo_Nombre, 
    dbo._Apu_Rubro_Codigo(Apu_Rubro_Id) AS Apu_Rubro_Codigo, 
    dbo._Apu_Rubro_Nombre(Apu_Rubro_Id) AS Apu_Rubro_Nombre, 
	dbo._Apu_Rubro_Unidad(Apu_Rubro_Id) AS Apu_Rubro_Unidad, 
    dbo._Apu_Subtitulo_Apu_Titulo_Id(Apu_Subtitulo_Id) AS Apu_Titulo_id, 
    dbo._Apu_Titulo_Codigo(dbo._Apu_Subtitulo_Apu_Titulo_Id(Apu_Subtitulo_Id)) AS Apu_Titulo_Codigo, 
	dbo._Apu_Titulo_Nombre(dbo._Apu_Subtitulo_Apu_Titulo_Id(Apu_Subtitulo_Id)) AS Apu_Titulo_Nombre, 
	dbo._Apu_Proyecto_Rubro_Rendimiento_Mano_Obra_Hora(Id) AS Rendimiento_Mano_Obra_Hora, 
	dbo._Apu_Proyecto_Rubro_Rendimiento_Equipo_Hora(Id) AS Rendimiento_Equipo_Hora, 
	dbo._apu_proyecto_rubro_material_costo_total(Id) AS Material_costo_total, 
	dbo._apu_proyecto_rubro_transporte_costo_total(Id) AS Transporte_costo_total, 
	dbo._apu_proyecto_rubro_mano_obra_costo_total(Id) AS Mano_obra_costo_total, 
	dbo._apu_proyecto_rubro_equipo_costo_total(Id) AS Equipo_costo_total, 
	dbo._Apu_Proyecto_Rubro_Costo_Unitario(Id) AS Costo_Unitario, 
	dbo._Apu_Proyecto_Rubro_Costo_Total_Con_Ind(Id) AS Costo_Total, 
	dbo._Apu_Proyecto_Etapa(Apu_Proyecto_Id) AS Apu_Proyecto_Etapa, 
	dbo._Apu_Rubro_Costo_Total(Apu_Rubro_Id, dbo._Apu_Proyecto_Int_Sucursal_Id(Apu_Proyecto_Id)) AS Apu_rubro_Costo_Total, 
	GETDATE() AS Material_ultima_fecha_update, 
	GETDATE() AS Transporte_ultima_fecha_update, 
	GETDATE() AS Mano_obra_ultima_fecha_update, 
	GETDATE() AS Equipo_ultima_fecha_update, 
	dbo._Apu_Proyecto_Rubro_Int_Moneda_Simbolo(Id) AS int_moneda_simbolo, 
	dbo._Apu_Proyecto_Int_Sucursal_Id(Apu_Proyecto_Id) AS Int_Sucursal_Id
FROM         dbo.Apu_Proyecto_Rubro


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[35] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Apu_Proyecto_Rubro"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 234
               Right = 248
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'v_Apu_Proyecto_Rubro';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'v_Apu_Proyecto_Rubro';

