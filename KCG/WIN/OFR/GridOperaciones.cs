using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;
using System.Text.RegularExpressions;
using System.Data;

namespace WIN.OFR
{
    public static class GridOperaciones
    {
        /// <summary>
        /// Borra las filas seleccionadas en el grid
        /// </summary>
        /// <param name="grid"></param>
        internal static void BorrarFilas(DataGridView grid)
        {
            while (grid.SelectedRows.Count > 0 && grid.SelectedRows[0].Index != grid.Rows.Count - 1)
            {
                grid.Rows.RemoveAt(grid.SelectedRows[0].Index);
            }
        }
        /// <summary>
        /// Pega en el grid el texto que se encuentre en el Clipboard
        /// </summary>
        /// <param name="grid"></param>
        internal static void PegarDesdeClipboard(DataGridView gridMaster, DataGridView grid, DataTable dt)
        {
            
            if (!Clipboard.ContainsText()) return;
            string s = Clipboard.GetText();
            string[] lines = Regex.Split(s, "\r\n");
            try
            {
                int row = grid.CurrentCell.RowIndex;
                int col = grid.CurrentCell.ColumnIndex;
                for (int k=0; k < lines.Length - 1; ++k )
                {
                    string line = lines[k];
                    
                    if (row < grid.RowCount && line.Length > 0)
                    {
                        CrearNuevaFila( gridMaster,  grid,  dt, row);

                        string[] cells = line.Split('\t');
                        for (int i = 0; i < cells.GetLength(0); ++i)
                        {
                            if (col + i < grid.ColumnCount)
                            {
                                Type celdaTipo = grid[col + i, row].ValueType;
                                Type decimalTipo = Type.GetType("System.Decimal");
                                // Valor por defecto si el clipboard trae un nulo o vacio.
                                if (celdaTipo == decimalTipo)
                                    if (String.IsNullOrEmpty(cells[i]))
                                        cells[i] = "0";
                                // Asigna el valor a la celda
                                grid[col + i, row].Value = Convert.ChangeType(cells[i], celdaTipo);
                            }
                            else
                            {
                                break;
                            }
                        }
                        row++;
                    }
                    else
                    {
                        break;
                    }
                }
                // Si hay una fila adicional en el grid la borra
                if (grid.Rows.Count - 2 == row )
                    grid.Rows.RemoveAt(row);
            }
            catch (System.Exception e)
            {
                MessageBox.Show(e.Message);
            }
        }

        public static void CrearNuevaFila(DataGridView gridMaster, DataGridView grid, DataTable dt, int row)
        {
            DataRow dr = dt.NewRow();
            DataGridViewRow fila = grid.Rows[row];

            if ((grid.Rows.Count - 2 == row) || (fila.IsNewRow)) // dt.Rows.Count == row fila.IsNewRow
            {
                dr = dt.NewRow();
                if (!grid.Equals(gridMaster))
                {
                    dr["RubroCodigo"] = gridMaster.CurrentRow.Cells[0].Value;
                }
                else
                {
                    dr["Codigo"] = row.ToString();
                }
                dt.Rows.Add(dr);
            }
        }
    }
}
