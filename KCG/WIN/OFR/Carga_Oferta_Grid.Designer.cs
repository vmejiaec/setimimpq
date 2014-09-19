namespace WIN.OFR
{
    partial class Carga_Oferta_Grid
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.dgvManoObras = new System.Windows.Forms.DataGridView();
            this.cmsMenu = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.tsmiPegar = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmiBorrar = new System.Windows.Forms.ToolStripMenuItem();
            this.nuevaLíneaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.dgvRubros = new System.Windows.Forms.DataGridView();
            this.dgvEquipos = new System.Windows.Forms.DataGridView();
            this.dgvMateriales = new System.Windows.Forms.DataGridView();
            this.gbOfertaDatos = new System.Windows.Forms.GroupBox();
            this.llOfertaCarga = new System.Windows.Forms.LinkLabel();
            this.llOfertaManObrVerificar = new System.Windows.Forms.LinkLabel();
            this.llOfertaConsulta = new System.Windows.Forms.LinkLabel();
            this.tbOfertaCodigo = new System.Windows.Forms.TextBox();
            this.lblOfertaCodigo = new System.Windows.Forms.Label();
            this.tbOfertaIndirecto = new System.Windows.Forms.TextBox();
            this.lblOfertaIndirecto = new System.Windows.Forms.Label();
            this.tbOfertaOferente = new System.Windows.Forms.TextBox();
            this.lblOfertaArea = new System.Windows.Forms.Label();
            this.tbOfertaNombre = new System.Windows.Forms.TextBox();
            this.lblOfertaNombre = new System.Windows.Forms.Label();
            this.gbUsuarioDatos = new System.Windows.Forms.GroupBox();
            this.llBorrar = new System.Windows.Forms.LinkLabel();
            this.llCargar = new System.Windows.Forms.LinkLabel();
            this.llGuardar = new System.Windows.Forms.LinkLabel();
            this.lblClave = new System.Windows.Forms.Label();
            this.lblUsuario = new System.Windows.Forms.Label();
            this.tbClave = new System.Windows.Forms.TextBox();
            this.tbUsuario = new System.Windows.Forms.TextBox();
            this.tcOfertaAPU = new System.Windows.Forms.TabControl();
            this.tpOfertaAPU = new System.Windows.Forms.TabPage();
            this.tpRelacionMO = new System.Windows.Forms.TabPage();
            this.dgvResMANDet = new System.Windows.Forms.DataGridView();
            this.dgvResMANCab = new System.Windows.Forms.DataGridView();
            this.tpRelacionMAT = new System.Windows.Forms.TabPage();
            this.dgvResMATDet = new System.Windows.Forms.DataGridView();
            this.dgvResMATCab = new System.Windows.Forms.DataGridView();
            this.tpRelacionEQU = new System.Windows.Forms.TabPage();
            this.dgvResEQUDet = new System.Windows.Forms.DataGridView();
            this.dgvResEQUCab = new System.Windows.Forms.DataGridView();
            this.tbOfertaCostoTotal = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvManoObras)).BeginInit();
            this.cmsMenu.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvRubros)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvEquipos)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvMateriales)).BeginInit();
            this.gbOfertaDatos.SuspendLayout();
            this.gbUsuarioDatos.SuspendLayout();
            this.tcOfertaAPU.SuspendLayout();
            this.tpOfertaAPU.SuspendLayout();
            this.tpRelacionMO.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvResMANDet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvResMANCab)).BeginInit();
            this.tpRelacionMAT.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvResMATDet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvResMATCab)).BeginInit();
            this.tpRelacionEQU.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvResEQUDet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvResEQUCab)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvManoObras
            // 
            this.dgvManoObras.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvManoObras.ContextMenuStrip = this.cmsMenu;
            this.dgvManoObras.Location = new System.Drawing.Point(654, 208);
            this.dgvManoObras.Name = "dgvManoObras";
            this.dgvManoObras.Size = new System.Drawing.Size(384, 213);
            this.dgvManoObras.TabIndex = 3;
            this.dgvManoObras.RowValidated += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvManoObras_RowValidated);
            this.dgvManoObras.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dgvManoObra_KeyDown);
            // 
            // cmsMenu
            // 
            this.cmsMenu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsmiPegar,
            this.tsmiBorrar,
            this.nuevaLíneaToolStripMenuItem});
            this.cmsMenu.Name = "cmsMenu";
            this.cmsMenu.RenderMode = System.Windows.Forms.ToolStripRenderMode.Professional;
            this.cmsMenu.Size = new System.Drawing.Size(145, 70);
            this.cmsMenu.Text = "Pegar";
            // 
            // tsmiPegar
            // 
            this.tsmiPegar.AutoToolTip = true;
            this.tsmiPegar.DoubleClickEnabled = true;
            this.tsmiPegar.Name = "tsmiPegar";
            this.tsmiPegar.Size = new System.Drawing.Size(144, 22);
            this.tsmiPegar.Text = "Pegar";
            this.tsmiPegar.ToolTipText = "Pegar";
            this.tsmiPegar.Click += new System.EventHandler(this.tsmiPegar_Click);
            // 
            // tsmiBorrar
            // 
            this.tsmiBorrar.Name = "tsmiBorrar";
            this.tsmiBorrar.Size = new System.Drawing.Size(144, 22);
            this.tsmiBorrar.Text = "Borrar";
            this.tsmiBorrar.Click += new System.EventHandler(this.tsmiBorrar_Click);
            // 
            // nuevaLíneaToolStripMenuItem
            // 
            this.nuevaLíneaToolStripMenuItem.Name = "nuevaLíneaToolStripMenuItem";
            this.nuevaLíneaToolStripMenuItem.Size = new System.Drawing.Size(144, 22);
            this.nuevaLíneaToolStripMenuItem.Text = "Nueva Línea";
            // 
            // dgvRubros
            // 
            this.dgvRubros.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvRubros.ContextMenuStrip = this.cmsMenu;
            this.dgvRubros.Location = new System.Drawing.Point(5, 6);
            this.dgvRubros.Name = "dgvRubros";
            this.dgvRubros.Size = new System.Drawing.Size(643, 647);
            this.dgvRubros.TabIndex = 0;
            this.dgvRubros.RowValidated += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvRubros_RowValidated);
            this.dgvRubros.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dgvRubros_KeyDown);
            // 
            // dgvEquipos
            // 
            this.dgvEquipos.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvEquipos.ContextMenuStrip = this.cmsMenu;
            this.dgvEquipos.Location = new System.Drawing.Point(654, 6);
            this.dgvEquipos.Name = "dgvEquipos";
            this.dgvEquipos.Size = new System.Drawing.Size(384, 196);
            this.dgvEquipos.TabIndex = 2;
            this.dgvEquipos.RowValidated += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvEquipos_RowValidated);
            this.dgvEquipos.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dgvEquipos_KeyDown);
            // 
            // dgvMateriales
            // 
            this.dgvMateriales.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvMateriales.ContextMenuStrip = this.cmsMenu;
            this.dgvMateriales.Location = new System.Drawing.Point(654, 427);
            this.dgvMateriales.Name = "dgvMateriales";
            this.dgvMateriales.Size = new System.Drawing.Size(384, 226);
            this.dgvMateriales.TabIndex = 4;
            this.dgvMateriales.RowValidated += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvMateriales_RowValidated);
            this.dgvMateriales.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dgvMaterial_KeyDown);
            // 
            // gbOfertaDatos
            // 
            this.gbOfertaDatos.Controls.Add(this.llOfertaCarga);
            this.gbOfertaDatos.Controls.Add(this.llOfertaManObrVerificar);
            this.gbOfertaDatos.Controls.Add(this.llOfertaConsulta);
            this.gbOfertaDatos.Controls.Add(this.tbOfertaCodigo);
            this.gbOfertaDatos.Controls.Add(this.lblOfertaCodigo);
            this.gbOfertaDatos.Controls.Add(this.tbOfertaIndirecto);
            this.gbOfertaDatos.Controls.Add(this.lblOfertaIndirecto);
            this.gbOfertaDatos.Controls.Add(this.tbOfertaOferente);
            this.gbOfertaDatos.Controls.Add(this.lblOfertaArea);
            this.gbOfertaDatos.Controls.Add(this.tbOfertaNombre);
            this.gbOfertaDatos.Controls.Add(this.lblOfertaNombre);
            this.gbOfertaDatos.Location = new System.Drawing.Point(177, 12);
            this.gbOfertaDatos.Name = "gbOfertaDatos";
            this.gbOfertaDatos.Size = new System.Drawing.Size(867, 108);
            this.gbOfertaDatos.TabIndex = 5;
            this.gbOfertaDatos.TabStop = false;
            this.gbOfertaDatos.Text = "Oferta";
            // 
            // llOfertaCarga
            // 
            this.llOfertaCarga.AutoSize = true;
            this.llOfertaCarga.Location = new System.Drawing.Point(747, 72);
            this.llOfertaCarga.Name = "llOfertaCarga";
            this.llOfertaCarga.Size = new System.Drawing.Size(70, 13);
            this.llOfertaCarga.TabIndex = 11;
            this.llOfertaCarga.TabStop = true;
            this.llOfertaCarga.Text = "Cargar Oferta";
            this.llOfertaCarga.Click += new System.EventHandler(this.llOfertaCarga_Click);
            // 
            // llOfertaManObrVerificar
            // 
            this.llOfertaManObrVerificar.AutoSize = true;
            this.llOfertaManObrVerificar.Location = new System.Drawing.Point(747, 45);
            this.llOfertaManObrVerificar.Name = "llOfertaManObrVerificar";
            this.llOfertaManObrVerificar.Size = new System.Drawing.Size(101, 13);
            this.llOfertaManObrVerificar.TabIndex = 10;
            this.llOfertaManObrVerificar.TabStop = true;
            this.llOfertaManObrVerificar.Text = "Calcula Resúmenes";
            this.llOfertaManObrVerificar.Click += new System.EventHandler(this.llOfertaManObrVerificar_Click);
            // 
            // llOfertaConsulta
            // 
            this.llOfertaConsulta.AutoSize = true;
            this.llOfertaConsulta.Location = new System.Drawing.Point(747, 18);
            this.llOfertaConsulta.Name = "llOfertaConsulta";
            this.llOfertaConsulta.Size = new System.Drawing.Size(83, 13);
            this.llOfertaConsulta.TabIndex = 8;
            this.llOfertaConsulta.TabStop = true;
            this.llOfertaConsulta.Text = "Consultar Oferta";
            this.llOfertaConsulta.Click += new System.EventHandler(this.llOfertaConsulta_Click);
            // 
            // tbOfertaCodigo
            // 
            this.tbOfertaCodigo.Location = new System.Drawing.Point(56, 15);
            this.tbOfertaCodigo.Name = "tbOfertaCodigo";
            this.tbOfertaCodigo.Size = new System.Drawing.Size(292, 20);
            this.tbOfertaCodigo.TabIndex = 9;
            // 
            // lblOfertaCodigo
            // 
            this.lblOfertaCodigo.AutoSize = true;
            this.lblOfertaCodigo.Location = new System.Drawing.Point(6, 15);
            this.lblOfertaCodigo.Name = "lblOfertaCodigo";
            this.lblOfertaCodigo.Size = new System.Drawing.Size(40, 13);
            this.lblOfertaCodigo.TabIndex = 8;
            this.lblOfertaCodigo.Text = "Código";
            // 
            // tbOfertaIndirecto
            // 
            this.tbOfertaIndirecto.Location = new System.Drawing.Point(422, 15);
            this.tbOfertaIndirecto.Name = "tbOfertaIndirecto";
            this.tbOfertaIndirecto.Size = new System.Drawing.Size(62, 20);
            this.tbOfertaIndirecto.TabIndex = 5;
            this.tbOfertaIndirecto.Text = "15";
            this.tbOfertaIndirecto.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // lblOfertaIndirecto
            // 
            this.lblOfertaIndirecto.AutoSize = true;
            this.lblOfertaIndirecto.Location = new System.Drawing.Point(355, 18);
            this.lblOfertaIndirecto.Name = "lblOfertaIndirecto";
            this.lblOfertaIndirecto.Size = new System.Drawing.Size(59, 13);
            this.lblOfertaIndirecto.TabIndex = 4;
            this.lblOfertaIndirecto.Text = "% Indirecto";
            // 
            // tbOfertaOferente
            // 
            this.tbOfertaOferente.Location = new System.Drawing.Point(544, 15);
            this.tbOfertaOferente.Name = "tbOfertaOferente";
            this.tbOfertaOferente.Size = new System.Drawing.Size(201, 20);
            this.tbOfertaOferente.TabIndex = 3;
            this.tbOfertaOferente.Text = "Oferente";
            this.tbOfertaOferente.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // lblOfertaArea
            // 
            this.lblOfertaArea.AutoSize = true;
            this.lblOfertaArea.Location = new System.Drawing.Point(490, 19);
            this.lblOfertaArea.Name = "lblOfertaArea";
            this.lblOfertaArea.Size = new System.Drawing.Size(48, 13);
            this.lblOfertaArea.TabIndex = 2;
            this.lblOfertaArea.Text = "Oferente";
            // 
            // tbOfertaNombre
            // 
            this.tbOfertaNombre.Location = new System.Drawing.Point(56, 41);
            this.tbOfertaNombre.Multiline = true;
            this.tbOfertaNombre.Name = "tbOfertaNombre";
            this.tbOfertaNombre.Size = new System.Drawing.Size(689, 51);
            this.tbOfertaNombre.TabIndex = 1;
            // 
            // lblOfertaNombre
            // 
            this.lblOfertaNombre.AutoSize = true;
            this.lblOfertaNombre.Location = new System.Drawing.Point(6, 41);
            this.lblOfertaNombre.Name = "lblOfertaNombre";
            this.lblOfertaNombre.Size = new System.Drawing.Size(44, 13);
            this.lblOfertaNombre.TabIndex = 0;
            this.lblOfertaNombre.Text = "Nombre";
            // 
            // gbUsuarioDatos
            // 
            this.gbUsuarioDatos.Controls.Add(this.llBorrar);
            this.gbUsuarioDatos.Controls.Add(this.llCargar);
            this.gbUsuarioDatos.Controls.Add(this.llGuardar);
            this.gbUsuarioDatos.Controls.Add(this.lblClave);
            this.gbUsuarioDatos.Controls.Add(this.lblUsuario);
            this.gbUsuarioDatos.Controls.Add(this.tbClave);
            this.gbUsuarioDatos.Controls.Add(this.tbUsuario);
            this.gbUsuarioDatos.Location = new System.Drawing.Point(2, 12);
            this.gbUsuarioDatos.Name = "gbUsuarioDatos";
            this.gbUsuarioDatos.Size = new System.Drawing.Size(169, 108);
            this.gbUsuarioDatos.TabIndex = 6;
            this.gbUsuarioDatos.TabStop = false;
            this.gbUsuarioDatos.Text = "Usuario";
            // 
            // llBorrar
            // 
            this.llBorrar.AutoSize = true;
            this.llBorrar.Location = new System.Drawing.Point(123, 79);
            this.llBorrar.Name = "llBorrar";
            this.llBorrar.Size = new System.Drawing.Size(35, 13);
            this.llBorrar.TabIndex = 12;
            this.llBorrar.TabStop = true;
            this.llBorrar.Text = "Borrar";
            this.llBorrar.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.llBorrar_LinkClicked);
            // 
            // llCargar
            // 
            this.llCargar.AutoSize = true;
            this.llCargar.Location = new System.Drawing.Point(70, 79);
            this.llCargar.Name = "llCargar";
            this.llCargar.Size = new System.Drawing.Size(38, 13);
            this.llCargar.TabIndex = 9;
            this.llCargar.TabStop = true;
            this.llCargar.Text = "Cargar";
            this.llCargar.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.llCargar_LinkClicked);
            // 
            // llGuardar
            // 
            this.llGuardar.AutoSize = true;
            this.llGuardar.Location = new System.Drawing.Point(7, 79);
            this.llGuardar.Name = "llGuardar";
            this.llGuardar.Size = new System.Drawing.Size(45, 13);
            this.llGuardar.TabIndex = 9;
            this.llGuardar.TabStop = true;
            this.llGuardar.Text = "Guardar";
            this.llGuardar.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.llGuardar_LinkClicked);
            // 
            // lblClave
            // 
            this.lblClave.AutoSize = true;
            this.lblClave.Location = new System.Drawing.Point(6, 48);
            this.lblClave.Name = "lblClave";
            this.lblClave.Size = new System.Drawing.Size(34, 13);
            this.lblClave.TabIndex = 3;
            this.lblClave.Text = "Clave";
            // 
            // lblUsuario
            // 
            this.lblUsuario.AutoSize = true;
            this.lblUsuario.Location = new System.Drawing.Point(6, 22);
            this.lblUsuario.Name = "lblUsuario";
            this.lblUsuario.Size = new System.Drawing.Size(43, 13);
            this.lblUsuario.TabIndex = 2;
            this.lblUsuario.Text = "Usuario";
            // 
            // tbClave
            // 
            this.tbClave.Location = new System.Drawing.Point(55, 45);
            this.tbClave.Name = "tbClave";
            this.tbClave.PasswordChar = '*';
            this.tbClave.Size = new System.Drawing.Size(100, 20);
            this.tbClave.TabIndex = 1;
            this.tbClave.UseSystemPasswordChar = true;
            // 
            // tbUsuario
            // 
            this.tbUsuario.Location = new System.Drawing.Point(55, 19);
            this.tbUsuario.Name = "tbUsuario";
            this.tbUsuario.Size = new System.Drawing.Size(100, 20);
            this.tbUsuario.TabIndex = 0;
            // 
            // tcOfertaAPU
            // 
            this.tcOfertaAPU.Controls.Add(this.tpOfertaAPU);
            this.tcOfertaAPU.Controls.Add(this.tpRelacionMO);
            this.tcOfertaAPU.Controls.Add(this.tpRelacionMAT);
            this.tcOfertaAPU.Controls.Add(this.tpRelacionEQU);
            this.tcOfertaAPU.Location = new System.Drawing.Point(2, 133);
            this.tcOfertaAPU.Name = "tcOfertaAPU";
            this.tcOfertaAPU.SelectedIndex = 0;
            this.tcOfertaAPU.Size = new System.Drawing.Size(1051, 685);
            this.tcOfertaAPU.TabIndex = 7;
            // 
            // tpOfertaAPU
            // 
            this.tpOfertaAPU.Controls.Add(this.dgvRubros);
            this.tpOfertaAPU.Controls.Add(this.dgvEquipos);
            this.tpOfertaAPU.Controls.Add(this.dgvManoObras);
            this.tpOfertaAPU.Controls.Add(this.dgvMateriales);
            this.tpOfertaAPU.Location = new System.Drawing.Point(4, 22);
            this.tpOfertaAPU.Name = "tpOfertaAPU";
            this.tpOfertaAPU.Padding = new System.Windows.Forms.Padding(3);
            this.tpOfertaAPU.Size = new System.Drawing.Size(1043, 659);
            this.tpOfertaAPU.TabIndex = 0;
            this.tpOfertaAPU.Text = "APU Oferta";
            this.tpOfertaAPU.UseVisualStyleBackColor = true;
            // 
            // tpRelacionMO
            // 
            this.tpRelacionMO.Controls.Add(this.dgvResMANDet);
            this.tpRelacionMO.Controls.Add(this.dgvResMANCab);
            this.tpRelacionMO.Location = new System.Drawing.Point(4, 22);
            this.tpRelacionMO.Name = "tpRelacionMO";
            this.tpRelacionMO.Padding = new System.Windows.Forms.Padding(3);
            this.tpRelacionMO.Size = new System.Drawing.Size(1043, 659);
            this.tpRelacionMO.TabIndex = 1;
            this.tpRelacionMO.Text = "Resumen de Mano de Obra";
            this.tpRelacionMO.UseVisualStyleBackColor = true;
            // 
            // dgvResMANDet
            // 
            this.dgvResMANDet.AllowUserToAddRows = false;
            this.dgvResMANDet.AllowUserToDeleteRows = false;
            this.dgvResMANDet.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvResMANDet.Location = new System.Drawing.Point(589, 6);
            this.dgvResMANDet.Name = "dgvResMANDet";
            this.dgvResMANDet.Size = new System.Drawing.Size(448, 647);
            this.dgvResMANDet.TabIndex = 1;
            // 
            // dgvResMANCab
            // 
            this.dgvResMANCab.AllowUserToAddRows = false;
            this.dgvResMANCab.AllowUserToDeleteRows = false;
            this.dgvResMANCab.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvResMANCab.Location = new System.Drawing.Point(6, 6);
            this.dgvResMANCab.Name = "dgvResMANCab";
            this.dgvResMANCab.Size = new System.Drawing.Size(577, 647);
            this.dgvResMANCab.TabIndex = 0;
            this.dgvResMANCab.CellValueChanged += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvMOCab_CellValueChanged);
            this.dgvResMANCab.CurrentCellDirtyStateChanged += new System.EventHandler(this.dgvMOCab_CurrentCellDirtyStateChanged);
            // 
            // tpRelacionMAT
            // 
            this.tpRelacionMAT.Controls.Add(this.dgvResMATDet);
            this.tpRelacionMAT.Controls.Add(this.dgvResMATCab);
            this.tpRelacionMAT.Location = new System.Drawing.Point(4, 22);
            this.tpRelacionMAT.Name = "tpRelacionMAT";
            this.tpRelacionMAT.Padding = new System.Windows.Forms.Padding(3);
            this.tpRelacionMAT.Size = new System.Drawing.Size(1043, 659);
            this.tpRelacionMAT.TabIndex = 2;
            this.tpRelacionMAT.Text = "Resumen de Materiales";
            this.tpRelacionMAT.UseVisualStyleBackColor = true;
            // 
            // dgvResMATDet
            // 
            this.dgvResMATDet.AllowUserToAddRows = false;
            this.dgvResMATDet.AllowUserToDeleteRows = false;
            this.dgvResMATDet.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvResMATDet.Location = new System.Drawing.Point(589, 6);
            this.dgvResMATDet.Name = "dgvResMATDet";
            this.dgvResMATDet.Size = new System.Drawing.Size(448, 647);
            this.dgvResMATDet.TabIndex = 1;
            // 
            // dgvResMATCab
            // 
            this.dgvResMATCab.AllowUserToAddRows = false;
            this.dgvResMATCab.AllowUserToDeleteRows = false;
            this.dgvResMATCab.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvResMATCab.Location = new System.Drawing.Point(6, 6);
            this.dgvResMATCab.Name = "dgvResMATCab";
            this.dgvResMATCab.Size = new System.Drawing.Size(577, 647);
            this.dgvResMATCab.TabIndex = 0;
            // 
            // tpRelacionEQU
            // 
            this.tpRelacionEQU.Controls.Add(this.dgvResEQUDet);
            this.tpRelacionEQU.Controls.Add(this.dgvResEQUCab);
            this.tpRelacionEQU.Location = new System.Drawing.Point(4, 22);
            this.tpRelacionEQU.Name = "tpRelacionEQU";
            this.tpRelacionEQU.Padding = new System.Windows.Forms.Padding(3);
            this.tpRelacionEQU.Size = new System.Drawing.Size(1043, 659);
            this.tpRelacionEQU.TabIndex = 3;
            this.tpRelacionEQU.Text = "Resumen de Equipos";
            this.tpRelacionEQU.UseVisualStyleBackColor = true;
            // 
            // dgvResEQUDet
            // 
            this.dgvResEQUDet.AllowUserToAddRows = false;
            this.dgvResEQUDet.AllowUserToDeleteRows = false;
            this.dgvResEQUDet.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvResEQUDet.Location = new System.Drawing.Point(589, 6);
            this.dgvResEQUDet.Name = "dgvResEQUDet";
            this.dgvResEQUDet.Size = new System.Drawing.Size(448, 647);
            this.dgvResEQUDet.TabIndex = 3;
            // 
            // dgvResEQUCab
            // 
            this.dgvResEQUCab.AllowUserToAddRows = false;
            this.dgvResEQUCab.AllowUserToDeleteRows = false;
            this.dgvResEQUCab.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvResEQUCab.Location = new System.Drawing.Point(5, 6);
            this.dgvResEQUCab.Name = "dgvResEQUCab";
            this.dgvResEQUCab.Size = new System.Drawing.Size(577, 647);
            this.dgvResEQUCab.TabIndex = 2;
            // 
            // tbOfertaCostoTotal
            // 
            this.tbOfertaCostoTotal.Location = new System.Drawing.Point(497, 126);
            this.tbOfertaCostoTotal.Name = "tbOfertaCostoTotal";
            this.tbOfertaCostoTotal.Size = new System.Drawing.Size(138, 20);
            this.tbOfertaCostoTotal.TabIndex = 8;
            this.tbOfertaCostoTotal.Text = "0.0";
            this.tbOfertaCostoTotal.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // Carga_Oferta_Grid
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1056, 830);
            this.Controls.Add(this.tbOfertaCostoTotal);
            this.Controls.Add(this.tcOfertaAPU);
            this.Controls.Add(this.gbUsuarioDatos);
            this.Controls.Add(this.gbOfertaDatos);
            this.Name = "Carga_Oferta_Grid";
            this.Text = "Carga_Oferta_Grid";
            ((System.ComponentModel.ISupportInitialize)(this.dgvManoObras)).EndInit();
            this.cmsMenu.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvRubros)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvEquipos)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvMateriales)).EndInit();
            this.gbOfertaDatos.ResumeLayout(false);
            this.gbOfertaDatos.PerformLayout();
            this.gbUsuarioDatos.ResumeLayout(false);
            this.gbUsuarioDatos.PerformLayout();
            this.tcOfertaAPU.ResumeLayout(false);
            this.tpOfertaAPU.ResumeLayout(false);
            this.tpRelacionMO.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvResMANDet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvResMANCab)).EndInit();
            this.tpRelacionMAT.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvResMATDet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvResMATCab)).EndInit();
            this.tpRelacionEQU.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvResEQUDet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvResEQUCab)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        public System.Windows.Forms.DataGridView dgvRubros;
        private System.Windows.Forms.ContextMenuStrip cmsMenu;
        private System.Windows.Forms.ToolStripMenuItem tsmiPegar;
        private System.Windows.Forms.ToolStripMenuItem tsmiBorrar;
        public System.Windows.Forms.DataGridView dgvEquipos;
        public System.Windows.Forms.DataGridView dgvMateriales;
        private System.Windows.Forms.GroupBox gbOfertaDatos;
        private System.Windows.Forms.GroupBox gbUsuarioDatos;
        private System.Windows.Forms.TextBox tbUsuario;
        private System.Windows.Forms.Label lblUsuario;
        private System.Windows.Forms.TextBox tbClave;
        private System.Windows.Forms.Label lblClave;
        private System.Windows.Forms.Label lblOfertaNombre;
        private System.Windows.Forms.Label lblOfertaArea;
        private System.Windows.Forms.TextBox tbOfertaNombre;
        private System.Windows.Forms.TextBox tbOfertaIndirecto;
        private System.Windows.Forms.Label lblOfertaIndirecto;
        private System.Windows.Forms.TextBox tbOfertaCodigo;
        private System.Windows.Forms.Label lblOfertaCodigo;
        private System.Windows.Forms.LinkLabel llOfertaConsulta;
        private System.Windows.Forms.LinkLabel llOfertaCarga;
        private System.Windows.Forms.LinkLabel llOfertaManObrVerificar;
        public System.Windows.Forms.DataGridView dgvManoObras;
        private System.Windows.Forms.ToolStripMenuItem nuevaLíneaToolStripMenuItem;
        private System.Windows.Forms.TabControl tcOfertaAPU;
        private System.Windows.Forms.TabPage tpOfertaAPU;
        private System.Windows.Forms.TabPage tpRelacionMO;
        public System.Windows.Forms.DataGridView dgvResMANCab;
        private System.Windows.Forms.TextBox tbOfertaCostoTotal;
        public System.Windows.Forms.DataGridView dgvResMANDet;
        private System.Windows.Forms.TabPage tpRelacionMAT;
        public System.Windows.Forms.DataGridView dgvResMATCab;
        public System.Windows.Forms.DataGridView dgvResMATDet;
        private System.Windows.Forms.TabPage tpRelacionEQU;
        public System.Windows.Forms.DataGridView dgvResEQUDet;
        public System.Windows.Forms.DataGridView dgvResEQUCab;
        private System.Windows.Forms.TextBox tbOfertaOferente;
        private System.Windows.Forms.LinkLabel llBorrar;
        private System.Windows.Forms.LinkLabel llCargar;
        private System.Windows.Forms.LinkLabel llGuardar;
    }
}