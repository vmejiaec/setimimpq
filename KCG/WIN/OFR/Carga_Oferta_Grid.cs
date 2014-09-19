using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Text.RegularExpressions;

namespace WIN.OFR
{
    public partial class Carga_Oferta_Grid : Form
    {
        // Contiene las tablas de datos
        public Oferta oferta = new Oferta();
        // Constructor
        public Carga_Oferta_Grid()
        {
            InitializeComponent();
            // Inicializa las tablas y los grids
            oferta.PrepararTablas();
            oferta.AsociarTablasConGrids(this);
            oferta.FormatearColumnas(this);
        }

        // Eventos para del control-V
        void dgvRubros_KeyDown(object sender, KeyEventArgs e)
        {
            DataGridView dgv = (DataGridView)sender;
            if(e.Control && e.KeyCode == Keys.V)
            {
                GridOperaciones.PegarDesdeClipboard(dgvRubros, dgv, oferta.dtRubros);
            }
        }
        void dgvEquipos_KeyDown(object sender, KeyEventArgs e)
        {
            DataGridView dgv = (DataGridView)sender;
            if (e.Control && e.KeyCode == Keys.V)
            {
                GridOperaciones.PegarDesdeClipboard(dgvRubros, dgv, oferta.dtEquipos);
            }
        }
        void dgvManoObra_KeyDown(object sender, KeyEventArgs e)
        {
            DataGridView dgv = (DataGridView)sender;
            if (e.Control && e.KeyCode == Keys.V)
            {
                GridOperaciones.PegarDesdeClipboard(dgvRubros, dgv, oferta.dtManoObras);
            }
        }
        void dgvMaterial_KeyDown(object sender, KeyEventArgs e)
        {
            DataGridView dgv = (DataGridView)sender;
            if (e.Control && e.KeyCode == Keys.V)
            {
                GridOperaciones.PegarDesdeClipboard(dgvRubros, dgv, oferta.dtMateriales);
            }
        }
        // Eventos para el menú
        void tsmiPegar_Click(object sender, EventArgs e)
        {
            ToolStripMenuItem item = sender as ToolStripMenuItem;
            ContextMenuStrip strip = item.Owner as ContextMenuStrip;
            DataGridView dgv = strip.SourceControl as DataGridView;
            DataTable dt = new DataTable();
            if (dgv.Equals(dgvRubros)) dt = oferta.dtRubros;
            if (dgv.Equals(dgvEquipos)) dt = oferta.dtEquipos;
            if (dgv.Equals(dgvManoObras)) dt = oferta.dtManoObras;
            if (dgv.Equals(dgvMateriales)) dt = oferta.dtMateriales;
            GridOperaciones.PegarDesdeClipboard(dgvRubros, dgv, dt);
        }

        private void tsmiBorrar_Click(object sender, EventArgs e)
        {
            ToolStripMenuItem item = sender as ToolStripMenuItem;
            ContextMenuStrip strip = item.Owner as ContextMenuStrip;
            DataGridView dgv = strip.SourceControl as DataGridView;
            GridOperaciones.BorrarFilas(dgv);
        }

        private void dgvEquipos_RowValidated(object sender, DataGridViewCellEventArgs e)
        {
            if (this.dgvRubros.CurrentRow != null)
            {
                //Buscar el registro en la tabla
                DataRow[] resRubro = oferta.dtRubros.Select(
                    "Codigo ='"
                    + dgvRubros.CurrentRow.Cells["Codigo"].Value
                    + "'"
                    );
                if (resRubro.Length > 0)
                {
                    Decimal PUD = oferta.getPrecioUnitarioDirecto(resRubro[0]);
                    dgvRubros["PrecioUnitario", dgvRubros.CurrentRow.Index].Value = PUD;
                }
            }
        }

        private void dgvManoObras_RowValidated(object sender, DataGridViewCellEventArgs e)
        {
            if (this.dgvRubros.CurrentRow != null)
            {
                //Buscar el registro en la tabla
                DataRow[] resRubro = oferta.dtRubros.Select(
                    "Codigo ='"
                    + dgvRubros.CurrentRow.Cells["Codigo"].Value
                    + "'"
                    );
                if (resRubro.Length > 0)
                {
                    Decimal PUD = oferta.getPrecioUnitarioDirecto(resRubro[0]);
                    dgvRubros["PrecioUnitario", dgvRubros.CurrentRow.Index].Value = PUD;
                }
            }
        }

        private void dgvMateriales_RowValidated(object sender, DataGridViewCellEventArgs e)
        {
            if (this.dgvRubros.CurrentRow != null)
            {
                //Buscar el registro en la tabla
                DataRow[] resRubro = oferta.dtRubros.Select(
                    "Codigo ='"
                    + dgvRubros.CurrentRow.Cells["Codigo"].Value
                    + "'"
                    );
                if (resRubro.Length > 0)
                {
                    Decimal PUD = oferta.getPrecioUnitarioDirecto(resRubro[0]);
                    dgvRubros["PrecioUnitario", dgvRubros.CurrentRow.Index].Value = PUD;
                }
            }
        }

        private void dgvRubros_RowValidated(object sender, DataGridViewCellEventArgs e)
        {
            decimal por_indirectos;
            por_indirectos = (tbOfertaIndirecto.Text == "") ?
                                0 :
                                decimal.Parse(tbOfertaIndirecto.Text)/100;
            if (e.RowIndex < oferta.dtRubros.Rows.Count)
            {
                //Buscar el registro en la tabla
                DataRow[] resRubro = oferta.dtRubros.Select(
                    "Codigo ='"
                    + dgvRubros["Codigo", e.RowIndex].Value
                    + "'"
                    );
                if (resRubro.Length > 0)
                {
                    Decimal PUD = oferta.getPrecioUnitarioDirecto(resRubro[0]);
                    dgvRubros["PrecioUnitario", e.RowIndex].Value = PUD;
                    tbOfertaCostoTotal.Text = (oferta.getCostoTotal(por_indirectos)).ToString("C");
                }
            }
        }

        private void llOfertaManObrVerificar_Click(object sender, EventArgs e)
        {
            llOfertaConsulta.Enabled = false;
            Cursor.Current = Cursors.WaitCursor;
            oferta.getResumenManoObra();
            dgvResMANCab.Sort(dgvResMANCab.Columns["OfertaNombre"], ListSortDirection.Ascending);
            oferta.getResumenMateriales();
            dgvResMATCab.Sort(dgvResMATCab.Columns["Nombre"], ListSortDirection.Ascending);
            oferta.getResumenEquipos();
            dgvResEQUCab.Sort(dgvResEQUCab.Columns["Nombre"], ListSortDirection.Ascending);
            llOfertaConsulta.Enabled = true;
            Cursor.Current = Cursors.Arrow;
        }

        private void dgvMOCab_CurrentCellDirtyStateChanged(object sender, EventArgs e)
        {
            if (dgvResMANCab.IsCurrentCellDirty)
            {
                dgvResMANCab.CommitEdit(DataGridViewDataErrorContexts.Commit);
            }
        }

        private void dgvMOCab_CellValueChanged(object sender, DataGridViewCellEventArgs e)
        {
            if (dgvResMANCab.Columns[e.ColumnIndex].Name == "comboBaseMO")
            {
                dgvResMANCab.Rows[e.RowIndex].Cells["BaseId"].Value =
                    dgvResMANCab.Rows[e.RowIndex].Cells[e.ColumnIndex].Value;
                dgvResMANCab.Rows[e.RowIndex].Cells["BaseNombre"].Value =
                    dgvResMANCab.CurrentCell.FormattedValue;
            }
        }

        private void llOfertaConsulta_Click(object sender, EventArgs e)
        {
            tbOfertaNombre.Text = oferta.GetOfertaByCodigoInst(tbOfertaCodigo.Text);
        }

        private void llOfertaCarga_Click(object sender, EventArgs e)
        {
            String OfertaCreadaCodigo;
            try
            {
                llOfertaConsulta.Enabled = false;
                Cursor.Current = Cursors.WaitCursor;
                OfertaCreadaCodigo = oferta.grabarOferta(
                    oferta.prepararOferta(
                        tbUsuario.Text, tbClave.Text,
                        tbOfertaNombre.Text,
                        Convert.ToDecimal(tbOfertaIndirecto.Text),
                        tbOfertaOferente.Text)
                    );
                Cursor.Current = Cursors.Arrow;
                llOfertaConsulta.Enabled = true;
                MessageBox.Show(OfertaCreadaCodigo);
            }
            catch (Exception exception)
            {
                Cursor.Current = Cursors.Arrow;
                llOfertaConsulta.Enabled = true;
                MessageBox.Show(exception.Message + " -> " + exception.InnerException);
            }
        }

        private void llBorrar_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            oferta.limpiarOferta();
        }

        private void llGuardar_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            oferta.grabarArchivoXML();
        }

        private void llCargar_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            oferta.leerArchivoXML();
        }

    }
}