using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Windows.Forms;
using WIN.OFR;
using AEL.APU;
using BEL;
using AEL.INT;
using CEL.INT;

namespace WIN
{
    public class Oferta
    {
        //[+]------------------------------------------------------------------------------------- 
        // Atributos
        #region
        // Tablas para datos
        public DataSet      ds                  = new DataSet();
        public DataTable    dtRubros            = new DataTable("Rubros");
        public DataTable    dtEquipos           = new DataTable("Equipos");
        public DataTable    dtManoObras         = new DataTable("ManoObras");
        public DataTable    dtMateriales        = new DataTable("Materiales");
        // Tablas para manejar los resumenes
        public DataTable    dtManCab            = new DataTable("ManCab");
        public DataTable    dtManDet            = new DataTable("ManDet");
        public DataTable    dtMatCab            = new DataTable("MatCab");
        public DataTable    dtMatDet            = new DataTable("MatDet");
        public DataTable    dtEquCab            = new DataTable("EquCab");
        public DataTable    dtEquDet            = new DataTable("EquDet");
        // Tablas para llenar combos
        public DataTable    dtBaseMO            = new DataTable("BaseMO");
        // Relaciones entre las tablas
        public DataRelation relRubroEquipo;
        public DataRelation relRubroManoObra;
        public DataRelation relRubroMaterial;
        public DataRelation relManCabDet;
        public DataRelation relMatCabDet;
        public DataRelation relEquCabDet;
        // Enumeración para los nombres de las tablas y las columnas
        enum eTablas
        {
            Rubros, 
            Equipos, ManoObras, Materiales,
            ManCab, ManDet, MatCab, MatDet, EquCab, EquDet,
            BaseMO
        };
        // 
        enum eRubros        { Codigo        , Nombre    , Unidad    , Cantidad  , PrecioUnitario  };
        enum eEquipos       { RubroCodigo   , Nombre    , Costo                                   };
        enum eManoObras     { RubroCodigo   , Nombre    , Costo                                   };
        enum eMateriales    { RubroCodigo   , Nombre    , Costo     , Transporte                  };
        //
        enum eEquCab { Id       , Nombre    , BaseId    , BaseNombre                        };
        enum eEquDet { CabId    , EquId     , Costo     , RubroCodigo   , RubroNombre       };
        enum eManCab { Id       , Nombre    , BaseId    , BaseNombre                        };
        enum eManDet { CabId    , ManId     , Costo     , RubroCodigo   , RubroNombre       };
        enum eMatCab { Id       , Nombre    , BaseId    , BaseNombre                        };
        enum eMatDet { CabId    , MatId     , Costo     , Transporte, RubroCodigo, RubroNombre };
        // 
        DataGridViewComboBoxColumn colComboBaseMO = new DataGridViewComboBoxColumn();
        #endregion
        //[+]------------------------------------------------------------------------------------- 
        public void PrepararTablas()
        {
            //
            // Tablas de Datos
            //
            #region 
            // Columnas para Rubros
            dtRubros.Columns.Add("Codigo"           , Type.GetType("System.String"));
            dtRubros.Columns.Add("Nombre"           , Type.GetType("System.String"));
            dtRubros.Columns.Add("Unidad"           , Type.GetType("System.String"));
            dtRubros.Columns.Add("Cantidad"         , Type.GetType("System.Decimal"));
            dtRubros.Columns.Add("PrecioUnitario"   , Type.GetType("System.Decimal"));
            // Columnas para Equipos
            dtEquipos.Columns.Add("RubroCodigo"     , Type.GetType("System.String"));
            dtEquipos.Columns.Add("Nombre"          , Type.GetType("System.String"));
            dtEquipos.Columns.Add("Costo"           , Type.GetType("System.Decimal"));
            // Columnas para Mano de Obras
            dtManoObras.Columns.Add("RubroCodigo"   , Type.GetType("System.String"));
            dtManoObras.Columns.Add("Nombre"        , Type.GetType("System.String"));
            dtManoObras.Columns.Add("Costo"         , Type.GetType("System.Decimal"));
            // Columnas para Materiales
            dtMateriales.Columns.Add("RubroCodigo"  , Type.GetType("System.String"));
            dtMateriales.Columns.Add("Nombre"       , Type.GetType("System.String"));
            dtMateriales.Columns.Add("Costo"        , Type.GetType("System.Decimal"));
            dtMateriales.Columns.Add("Transporte"   , Type.GetType("System.Decimal"));
            #endregion 
            //
            // Tablas de resumenes
            //
            #region
            // Columnas para Mano de Obra Resumen Cab
            dtManCab.Columns.Add("Id"               , Type.GetType("System.Int16"));
            dtManCab.Columns.Add("OfertaNombre"     , Type.GetType("System.String"));
            dtManCab.Columns.Add("BaseId"           , Type.GetType("System.String"));
            dtManCab.Columns.Add("BaseNombre"       , Type.GetType("System.String"));
            // ---> Det
            dtManDet.Columns.Add("CabId"            , Type.GetType("System.Int16"));
            dtManDet.Columns.Add("ManIndice"        , Type.GetType("System.Int16"));
            dtManDet.Columns.Add("Costo"            , Type.GetType("System.Decimal"));
            dtManDet.Columns.Add("RubroCodigo"      , Type.GetType("System.String"));
            dtManDet.Columns.Add("RubroNombre"      , Type.GetType("System.String"));
            // Columnas para el Resumen de Materiales
            dtMatCab.Columns.Add(eMatCab.Id.ToString()          , Type.GetType("System.Int16"));
            dtMatCab.Columns.Add(eMatCab.Nombre.ToString()      , Type.GetType("System.String"));
            dtMatCab.Columns.Add(eMatCab.BaseId.ToString()      , Type.GetType("System.String"));
            dtMatCab.Columns.Add(eMatCab.BaseNombre.ToString()  , Type.GetType("System.String"));
            // ---> Det
            dtMatDet.Columns.Add(eMatDet.CabId.ToString()       , Type.GetType("System.Int16"));
            dtMatDet.Columns.Add(eMatDet.MatId.ToString()       , Type.GetType("System.Int16"));
            dtMatDet.Columns.Add(eMatDet.Costo.ToString()       , Type.GetType("System.Decimal"));
            dtMatDet.Columns.Add(eMatDet.Transporte.ToString()  , Type.GetType("System.Decimal"));
            dtMatDet.Columns.Add(eMatDet.RubroCodigo.ToString() , Type.GetType("System.String"));
            dtMatDet.Columns.Add(eMatDet.RubroNombre.ToString() , Type.GetType("System.String"));
            // Columanas para el Resumen de Equipo
            dtEquCab.Columns.Add(eEquCab.Id.ToString()          , Type.GetType("System.Int16"));
            dtEquCab.Columns.Add(eEquCab.Nombre.ToString()      , Type.GetType("System.String"));
            dtEquCab.Columns.Add(eEquCab.BaseId.ToString()      , Type.GetType("System.String"));
            dtEquCab.Columns.Add(eEquCab.BaseNombre.ToString()  , Type.GetType("System.String"));
            // ---> Det
            dtEquDet.Columns.Add(eEquDet.CabId.ToString()       , Type.GetType("System.Int16"));
            dtEquDet.Columns.Add(eEquDet.EquId.ToString()       , Type.GetType("System.Int16"));
            dtEquDet.Columns.Add(eEquDet.Costo.ToString()       , Type.GetType("System.Decimal"));
            dtEquDet.Columns.Add(eEquDet.RubroCodigo.ToString() , Type.GetType("System.String"));
            dtEquDet.Columns.Add(eEquDet.RubroNombre.ToString() , Type.GetType("System.String"));
            #endregion
            //
            // Columnas para el combo la base de mano de obra
            //
            dtBaseMO.Columns.Add("BaseMOId"         , Type.GetType("System.String"));
            dtBaseMO.Columns.Add("BaseMONombre"     , Type.GetType("System.String"));
            // Carga de datos la base de mano de obra 
            getDatosBaseMO(dtBaseMO);
            //
            // Meter todo en la base ds
            //
            ds.Tables.Add(dtRubros);
            ds.Tables.Add(dtEquipos);
            ds.Tables.Add(dtManoObras);
            ds.Tables.Add(dtMateriales);
            ds.Tables.Add(dtManCab);
            ds.Tables.Add(dtManDet);
            ds.Tables.Add(dtEquCab);
            ds.Tables.Add(dtEquDet);
            ds.Tables.Add(dtMatCab);
            ds.Tables.Add(dtMatDet);
            ds.Tables.Add(dtBaseMO);
            //
            // Crear las relaciones
            //
            #region
            relRubroEquipo = 
                new DataRelation (
                    "RubroEquipo",
                    dtRubros.Columns["Codigo"],
                    dtEquipos.Columns["RubroCodigo"]);
            relRubroManoObra =
                new DataRelation(
                    "RubroManoObra",
                    dtRubros.Columns["Codigo"],
                    dtManoObras.Columns["RubroCodigo"]);
            relRubroMaterial =
                new DataRelation(
                    "RubroMaterial",
                    dtRubros.Columns["Codigo"],
                    dtMateriales.Columns["RubroCodigo"]);
            relManCabDet =
                new DataRelation(
                    "ManCabDet",
                    dtManCab.Columns["Id"],
                    dtManDet.Columns["CabId"]);
            relMatCabDet =
                new DataRelation(
                    "MatCabDet",
                    dtMatCab.Columns["Id"],
                    dtMatDet.Columns["CabId"]);
            relEquCabDet =
                new DataRelation(
                    "EquCabDet",
                    dtEquCab.Columns["Id"],
                    dtEquDet.Columns["CabId"]);
            #endregion
            //
            // Mete las relaciones en la base ds
            //
            ds.Relations.Add(relRubroEquipo);
            ds.Relations.Add(relRubroManoObra);
            ds.Relations.Add(relRubroMaterial);
            ds.Relations.Add(relManCabDet);
            ds.Relations.Add(relMatCabDet);
            ds.Relations.Add(relEquCabDet);
        }
        //[+]------------------------------------------------------------------------------------- 
        public void AsociarTablasConGrids(Carga_Oferta_Grid pantalla)
        {
            // Asociando Rubros
            BindingSource enlaceRubros  = new BindingSource();
            pantalla.dgvRubros.DataSource = enlaceRubros;
            enlaceRubros.DataSource     = ds;
            enlaceRubros.DataMember     = "Rubros";
            // Asociando Equipos
            BindingSource enlaceEquipos = new BindingSource();
            pantalla.dgvEquipos.DataSource = enlaceEquipos;
            enlaceEquipos.DataSource    = enlaceRubros;
            enlaceEquipos.DataMember    = "RubroEquipo";
            // Asociando Mano de Obras
            BindingSource enlaceManoObra = new BindingSource();
            pantalla.dgvManoObras.DataSource = enlaceManoObra;
            enlaceManoObra.DataSource   = enlaceRubros;
            enlaceManoObra.DataMember   = "RubroManoObra";
            // Asociando Materiales
            BindingSource enlaceMateriales = new BindingSource();
            pantalla.dgvMateriales.DataSource = enlaceMateriales;
            enlaceMateriales.DataSource = enlaceRubros;
            enlaceMateriales.DataMember = "RubroMaterial";
            // Asociaciones para las tablas de resúmenes
            // --- > Asociando ManCab para el resumen de mano de obra
            BindingSource enlaceManCab = new BindingSource();
            pantalla.dgvResMANCab.DataSource = enlaceManCab;
            enlaceManCab.DataSource = ds;
            enlaceManCab.DataMember = "ManCab";
            // --- > Asociando ManDet
            BindingSource enlaceManDet = new BindingSource();
            pantalla.dgvResMANDet.DataSource = enlaceManDet;
            enlaceManDet.DataSource = enlaceManCab;
            enlaceManDet.DataMember = "ManCabDet";
            // --- > Asociando MatCab
            BindingSource enlaceMatCab = new BindingSource();
            pantalla.dgvResMATCab.DataSource = enlaceMatCab;
            enlaceMatCab.DataSource = ds;
            enlaceMatCab.DataMember = "MatCab";
            // --- > Asociando MatDet
            BindingSource enlaceMatDet = new BindingSource();
            pantalla.dgvResMATDet.DataSource = enlaceMatDet;
            enlaceMatDet.DataSource = enlaceMatCab;
            enlaceMatDet.DataMember = "MatCabDet";
            // --- > Asociando EquCab
            BindingSource enlaceEquCab = new BindingSource();
            pantalla.dgvResEQUCab.DataSource = enlaceEquCab;
            enlaceEquCab.DataSource = ds;
            enlaceEquCab.DataMember = "EquCab";
            // --- > Asociando EquDet
            BindingSource enlaceEquDet = new BindingSource();
            pantalla.dgvResEQUDet.DataSource = enlaceEquDet;
            enlaceEquDet.DataSource = enlaceEquCab;
            enlaceEquDet.DataMember = "EquCabDet";
            // --- > Asociando el combo de la base de mano de obra
            BindingSource enlaceBaseMO = new BindingSource();
            colComboBaseMO.DataSource = enlaceBaseMO;
            enlaceBaseMO.DataSource = ds;
            enlaceBaseMO.DataMember = "BaseMO";
            colComboBaseMO.ValueMember = "BaseMOId";
            colComboBaseMO.DisplayMember = "BaseMONombre";
        }
        //[+]------------------------------------------------------------------------------------- 
        public void FormatearColumnas(Carga_Oferta_Grid pantalla)
        {
            //---------------------------------------------------------------------------------
            // Rubros
            #region
            pantalla.dgvRubros.RowHeadersWidth = 20;
            //  Codigo
            DataGridViewCellStyle estiloRubroCodigo = new DataGridViewCellStyle();
            estiloRubroCodigo.Alignment = DataGridViewContentAlignment.MiddleCenter;
            pantalla.dgvRubros.Columns["Codigo"].HeaderText = "Cod.";
            pantalla.dgvRubros.Columns["Codigo"].Width = 35;
            pantalla.dgvRubros.Columns["Codigo"].DefaultCellStyle = estiloRubroCodigo;
            pantalla.dgvRubros.Columns["Codigo"].SortMode = DataGridViewColumnSortMode.NotSortable;
            //  Nombre
            pantalla.dgvRubros.Columns["Nombre"].Width = 410;
            pantalla.dgvRubros.Columns["Nombre"].HeaderText = "Rubros";
            pantalla.dgvRubros.Columns["Nombre"].SortMode = DataGridViewColumnSortMode.NotSortable;
            //  Unidad
            DataGridViewCellStyle estiloRubroUnidad = new DataGridViewCellStyle();
            estiloRubroUnidad.Alignment = DataGridViewContentAlignment.MiddleCenter;
            pantalla.dgvRubros.Columns["Unidad"].HeaderText = "Und.";
            pantalla.dgvRubros.Columns["Unidad"].Width = 30;
            pantalla.dgvRubros.Columns["Unidad"].DefaultCellStyle = estiloRubroUnidad;
            pantalla.dgvRubros.Columns["Unidad"].SortMode = DataGridViewColumnSortMode.NotSortable;
            //  Cantidad
            DataGridViewCellStyle estiloRubroCantidad = new DataGridViewCellStyle();
            estiloRubroCantidad.Alignment = DataGridViewContentAlignment.MiddleRight;
            estiloRubroCantidad.Format = "N2";
            pantalla.dgvRubros.Columns["Cantidad"].Width = 70;
            pantalla.dgvRubros.Columns["Cantidad"].DefaultCellStyle = estiloRubroCantidad;
            pantalla.dgvRubros.Columns["Cantidad"].SortMode = DataGridViewColumnSortMode.NotSortable;
            //  Precio Unitario
            DataGridViewCellStyle estiloRubroPrecioUnitario = new DataGridViewCellStyle();
            estiloRubroPrecioUnitario.Alignment = DataGridViewContentAlignment.MiddleRight;
            estiloRubroPrecioUnitario.Format = "N2";
            pantalla.dgvRubros.Columns["PrecioUnitario"].Width = 70;
            pantalla.dgvRubros.Columns["PrecioUnitario"].HeaderText = "P.U.D.";
            pantalla.dgvRubros.Columns["PrecioUnitario"].DefaultCellStyle = estiloRubroPrecioUnitario;
            pantalla.dgvRubros.Columns["PrecioUnitario"].SortMode = DataGridViewColumnSortMode.NotSortable;
            #endregion
            //---------------------------------------------------------------------------------
            //Equipos
            #region
            //  Codigo de los rubros
            pantalla.dgvEquipos.Columns["RubroCodigo"].Width = 15;
            pantalla.dgvEquipos.Columns["RubroCodigo"].Visible = false;
            //  Nombre
            pantalla.dgvEquipos.Columns["Nombre"].Width = 200;
            pantalla.dgvEquipos.Columns["Nombre"].HeaderText = "Equipos";
            //  Costo
            DataGridViewCellStyle estiloEquiposCostos = new DataGridViewCellStyle();
            estiloEquiposCostos.Alignment = DataGridViewContentAlignment.MiddleRight;
            estiloEquiposCostos.Format = "C2";
            pantalla.dgvEquipos.Columns["Costo"].Width = 70;
            pantalla.dgvEquipos.Columns["Costo"].DefaultCellStyle = estiloEquiposCostos;
            #endregion
            //---------------------------------------------------------------------------------
            //Mano de Obras
            #region
            //  Codigo de los rubros
            pantalla.dgvManoObras.Columns["RubroCodigo"].Width = 15;
            pantalla.dgvManoObras.Columns["RubroCodigo"].Visible = false;
            //  Nombre
            pantalla.dgvManoObras.Columns["Nombre"].Width = 200;
            pantalla.dgvManoObras.Columns["Nombre"].HeaderText = "Mano de Obra";
            //  Costo
            DataGridViewCellStyle estiloManoObrasCostos = new DataGridViewCellStyle();
            estiloManoObrasCostos.Alignment = DataGridViewContentAlignment.MiddleRight;
            estiloManoObrasCostos.Format = "C2";
            pantalla.dgvManoObras.Columns["Costo"].Width = 70;
            pantalla.dgvManoObras.Columns["Costo"].DefaultCellStyle = estiloManoObrasCostos;
            #endregion
            //---------------------------------------------------------------------------------
            //Materiales
            #region
            //  Codigo de los rubros
            pantalla.dgvMateriales.Columns["RubroCodigo"].Width = 15;
            pantalla.dgvMateriales.Columns["RubroCodigo"].Visible = false;
            //  Nombre
            pantalla.dgvMateriales.Columns["Nombre"].Width = 200;
            pantalla.dgvMateriales.Columns["Nombre"].HeaderText = "Materiales";
            //  Costo
            DataGridViewCellStyle estiloMaterialesCostos = new DataGridViewCellStyle();
            estiloMaterialesCostos.Alignment = DataGridViewContentAlignment.MiddleRight;
            estiloMaterialesCostos.Format = "C2";
            pantalla.dgvMateriales.Columns["Costo"].Width = 70;
            pantalla.dgvMateriales.Columns["Costo"].DefaultCellStyle = estiloMaterialesCostos;
            //  Transporte
            DataGridViewCellStyle estiloMaterialesTransporte = new DataGridViewCellStyle();
            estiloMaterialesTransporte.Alignment = DataGridViewContentAlignment.MiddleRight;
            estiloMaterialesTransporte.Format = "C2";
            pantalla.dgvMateriales.Columns["Transporte"].Width = 70;
            pantalla.dgvMateriales.Columns["Transporte"].DefaultCellStyle = estiloMaterialesTransporte;
            #endregion
            //---------------------------------------------------------------------------------
            //Resumen de mano de obra Cab
            #region
            //  Id
            pantalla.dgvResMANCab.Columns["Id"].Width = 30;
            pantalla.dgvResMANCab.Columns["Id"].HeaderText = "Id";
            //  Nombre 
            pantalla.dgvResMANCab.Columns["OfertaNombre"].Width = 150;
            pantalla.dgvResMANCab.Columns["OfertaNombre"].HeaderText = "Mano de Obra en Oferta";
            //  Id de la mano de obra de la base
            pantalla.dgvResMANCab.Columns["BaseId"].Width = 80;
            pantalla.dgvResMANCab.Columns["BaseId"].Visible = false;
            //  Nombre de la mano de obra seleccionada de la bas
            pantalla.dgvResMANCab.Columns["BaseNombre"].Width = 80;
            pantalla.dgvResMANCab.Columns["BaseNombre"].Visible = false;
            //  Añade una columna tipo combo
            colComboBaseMO.Name = "comboBaseMO";
            colComboBaseMO.HeaderText = "Base de Mano de Obra";
            colComboBaseMO.Width = 340;
            pantalla.dgvResMANCab.Columns.Add(colComboBaseMO);
            //---------------------------------------------------------------------------------
            // --- > Mano de obra Det
            //  
            pantalla.dgvResMANDet.Columns["CabId"].Width = 35;
            pantalla.dgvResMANDet.Columns["CabId"].HeaderText = "Cab Id";
            // 
            pantalla.dgvResMANDet.Columns["ManIndice"].Width = 35;
            pantalla.dgvResMANDet.Columns["ManIndice"].HeaderText = "Man Id";
            //  Costo
            DataGridViewCellStyle estiloMODetCostos = new DataGridViewCellStyle();
            estiloMODetCostos.Alignment = DataGridViewContentAlignment.MiddleRight;
            estiloMODetCostos.Format = "C2";
            pantalla.dgvResMANDet.Columns["Costo"].Width = 50;
            pantalla.dgvResMANDet.Columns["Costo"].DefaultCellStyle = estiloMODetCostos;
            // Código del Rubro 
            pantalla.dgvResMANDet.Columns["RubroCodigo"].Width = 35;
            pantalla.dgvResMANDet.Columns["RubroCodigo"].HeaderText = "Rbr Cod";
            //  Nombre del Rubro 
            pantalla.dgvResMANDet.Columns["RubroNombre"].Width = 300;
            #endregion
            //---------------------------------------------------------------------------------
            //Resumen de Materiales Cab
            #region
            //  Id
            pantalla.dgvResMATCab.Columns[eMatCab.Id.ToString()].Width = 30;
            pantalla.dgvResMATCab.Columns[eMatCab.Id.ToString()].HeaderText = "Id";
            //  Nombre en la oferta
            pantalla.dgvResMATCab.Columns[eMatCab.Nombre.ToString()].Width = 150;
            //  Id de la base
            pantalla.dgvResMATCab.Columns[eMatCab.BaseId.ToString()].Width = 40;
            pantalla.dgvResMATCab.Columns[eMatCab.BaseId.ToString()].Visible = true;
            pantalla.dgvResMATCab.Columns[eMatCab.BaseId.ToString()].HeaderText = "Ind Id";
            //  Nombre de la base
            pantalla.dgvResMATCab.Columns[eMatCab.BaseNombre.ToString()].Width = 200;
            pantalla.dgvResMATCab.Columns[eMatCab.BaseNombre.ToString()].Visible = true;
            pantalla.dgvResMATCab.Columns[eMatCab.BaseNombre.ToString()].HeaderText = "Nombre del Indice";
            //---------------------------------------------------------------------------------
            // --- > Material Det
            //  
            pantalla.dgvResMATDet.Columns[eMatDet.CabId.ToString()].Width = 35;
            pantalla.dgvResMATDet.Columns[eMatDet.CabId.ToString()].HeaderText = "Cab Id";
            // 
            pantalla.dgvResMATDet.Columns[eMatDet.MatId.ToString()].Width = 35;
            pantalla.dgvResMATDet.Columns[eMatDet.MatId.ToString()].HeaderText = "Mat Id";
            //  Costo
            DataGridViewCellStyle estiloResMatDetCostos = new DataGridViewCellStyle();
            estiloResMatDetCostos.Alignment = DataGridViewContentAlignment.MiddleRight;
            estiloResMatDetCostos.Format = "C2";
            pantalla.dgvResMATDet.Columns[eMatDet.Costo.ToString()].Width = 50;
            pantalla.dgvResMATDet.Columns[eMatDet.Costo.ToString()].DefaultCellStyle = estiloResMatDetCostos;
            //  Transporte
            DataGridViewCellStyle estiloResMatDetTransporte = new DataGridViewCellStyle();
            estiloResMatDetTransporte.Alignment = DataGridViewContentAlignment.MiddleRight;
            estiloResMatDetTransporte.Format = "C2";
            pantalla.dgvResMATDet.Columns[eMatDet.Transporte.ToString()].Width = 60;
            pantalla.dgvResMATDet.Columns[eMatDet.Transporte.ToString()].DefaultCellStyle = estiloResMatDetTransporte;
            // Código del Rubro 
            pantalla.dgvResMATDet.Columns[eMatDet.RubroCodigo.ToString()].Width = 35;
            pantalla.dgvResMATDet.Columns[eMatDet.RubroCodigo.ToString()].HeaderText = "Rbr Cod";
            //  Nombre del Rubro 
            pantalla.dgvResMATDet.Columns[eMatDet.RubroNombre.ToString()].Width = 300;
            #endregion
            //---------------------------------------------------------------------------------
            //Resumen de Equipos Cab
            #region
            //  Id
            pantalla.dgvResEQUCab.Columns[eEquCab.Id.ToString()].Width = 30;
            pantalla.dgvResEQUCab.Columns[eEquCab.Id.ToString()].HeaderText = "Id";
            //  Nombre en la oferta
            pantalla.dgvResEQUCab.Columns[eEquCab.Nombre.ToString()].Width = 150;
            //  Id de la base
            pantalla.dgvResEQUCab.Columns[eEquCab.BaseId.ToString()].Width = 40;
            pantalla.dgvResEQUCab.Columns[eEquCab.BaseId.ToString()].Visible = true;
            //  Nombre de la base
            pantalla.dgvResEQUCab.Columns[eEquCab.BaseNombre.ToString()].Width = 200;
            pantalla.dgvResEQUCab.Columns[eEquCab.BaseNombre.ToString()].Visible = true;
            //---------------------------------------------------------------------------------
            // --- > Equipos Det
            //  
            pantalla.dgvResEQUDet.Columns[eEquDet.CabId.ToString()].Width = 35;
            pantalla.dgvResEQUDet.Columns[eEquDet.CabId.ToString()].HeaderText = "Cab Id";
            // 
            pantalla.dgvResEQUDet.Columns[eEquDet.EquId.ToString()].Width = 35;
            pantalla.dgvResEQUDet.Columns[eEquDet.EquId.ToString()].HeaderText = "Equ Id";
            //  Costo
            DataGridViewCellStyle estiloResEquDetCostos = new DataGridViewCellStyle();
            estiloResEquDetCostos.Alignment = DataGridViewContentAlignment.MiddleRight;
            estiloResEquDetCostos.Format = "C2";
            pantalla.dgvResEQUDet.Columns[eEquDet.Costo.ToString()].Width = 50;
            pantalla.dgvResEQUDet.Columns[eEquDet.Costo.ToString()].DefaultCellStyle = estiloResEquDetCostos;
            // Código del Rubro 
            pantalla.dgvResEQUDet.Columns[eEquDet.RubroCodigo.ToString()].Width = 35;
            pantalla.dgvResEQUDet.Columns[eEquDet.RubroCodigo.ToString()].HeaderText = "Rbr Cod";
            //  Nombre del Rubro 
            pantalla.dgvResEQUDet.Columns[eEquDet.RubroNombre.ToString()].Width = 300;
            #endregion
        }
        //[+]------------------------------------------------------------------------------------- 
        public decimal getPrecioUnitarioDirecto(DataRow dr)
        {
            decimal precio = 0;
            DataRow[] lstEquipos, lstManoObras, lstMaterial;
            lstEquipos = dr.GetChildRows(relRubroEquipo);
            lstManoObras = dr.GetChildRows(relRubroManoObra);
            lstMaterial = dr.GetChildRows(relRubroMaterial);
            foreach (DataRow equ in lstEquipos)
                precio +=
                    (equ["Costo"].ToString()=="") ?
                        0 :
                        (decimal)equ["Costo"];
            foreach (DataRow man in lstManoObras)
                precio +=
                    (man["Costo"].ToString() == "") ?
                        0 :
                        (decimal)man["Costo"];
            foreach (DataRow mat in lstMaterial)
                precio +=
                    ((mat["Costo"].ToString() == "") ?
                        0 :
                        (decimal)mat["Costo"])
                    +
                    ((mat["Transporte"].ToString() == "") ?
                        0 :
                        (decimal)mat["Transporte"]);
            return precio;
        }
        //[+]------------------------------------------------------------------------------------- 
        public decimal getCostoTotal(decimal por_indi)
        {
            decimal costoTotal = 0;
            decimal cantidad, pre_unit, pre_unit_indi, costo;
            
            foreach (DataRow dr in dtRubros.Rows)
            {
                cantidad = 0;
                pre_unit = 0;
                try
                {
                    cantidad = (dr["Cantidad"].ToString() == "") ?
                                    0 :
                                    (decimal)dr["Cantidad"];
                    pre_unit = (dr["PrecioUnitario"].ToString() == "") ?
                                    0 :
                                    (decimal)dr["PrecioUnitario"];
                }
                catch (Exception exc)
                {
                    //MessageBox.Show(exc.Message);
                    ;
                } 
                pre_unit_indi = decimal.Round(pre_unit * (1 + por_indi), 2, MidpointRounding.AwayFromZero);
                costo = decimal.Round(cantidad * pre_unit_indi, 2);
                costoTotal += costo;
            }
            return costoTotal;
        }
        //[+]------------------------------------------------------------------------------------- 
        public void getResumenManoObra()
        {
            String OfertaNombre;
            String BaseNombre;
            Boolean bExiste;
            int iCab;
            
            // Borro las tablas de cab y det
            int n = dtManDet.Rows.Count;
            //for (int i = 0; i < n ; ++i)
            //    dtManDet.Rows[0].Delete();
            n = dtManCab.Rows.Count;
            for (int i = 0; i < n ; ++i )
                dtManCab.Rows[0].Delete();

            // Se barre toda la mano de obra de la oferta
            for (int k = 0; k < dtManoObras.Rows.Count; ++k )
            {
                DataRow filaMan = dtManoObras.Rows[k];
                OfertaNombre = filaMan["Nombre"].ToString();
                // Averigua si ya está en el resumen
                bExiste = false;
                iCab = -1;
                for (int i = 0; i < dtManCab.Rows.Count; ++i)
                {
                    BaseNombre = dtManCab.Rows[i]["OfertaNombre"].ToString();
                    if (OfertaNombre.Equals(BaseNombre))
                    {
                        bExiste = true;
                        iCab = i;
                        break;
                    }
                }
                // Si no existe lo incluye en la lista de cabecera
                if (!bExiste)
                {
                    DataRow filaManCab = dtManCab.NewRow();
                    iCab = dtManCab.Rows.Count;
                    filaManCab["Id"] = iCab;
                    filaManCab["OfertaNombre"] = OfertaNombre;
                    dtManCab.Rows.Add(filaManCab);
                }
                // Exista o no, lo incluye en la lista de detalle
                DataRow filaManDet = dtManDet.NewRow();
                filaManDet["CabId"] = iCab;
                filaManDet["ManIndice"] = k;
                filaManDet["RubroCodigo"] = filaMan["RubroCodigo"].ToString();
                // Busca el nombre del rubro
                DataRow[] rubroEncontrado =
                    dtRubros.Select("Codigo = '" + filaMan["RubroCodigo"].ToString() + "'");
                if (rubroEncontrado.Length > 0)
                { 
                    filaManDet["RubroNombre"] = rubroEncontrado[0]["Nombre"];
                    filaManDet["Costo"] = filaMan["Costo"];
                }

                // Inserta el detalle
                dtManDet.Rows.Add(filaManDet);
            }
        }
        //[+]------------------------------------------------------------------------------------- 
        public void getResumenMateriales()
        {
            String OfertaNombre;
            String BaseNombre;
            Boolean bExiste;
            int iCab;

            // Borro las tablas de cab y det
            int n = dtMatCab.Rows.Count;
            for (int i = 0; i < n; ++i)
                dtMatCab.Rows[0].Delete();

            // Se barre toda la mano de obra de la oferta
            for (int k = 0; k < dtMateriales.Rows.Count; ++k)
            {
                DataRow filaMat = dtMateriales.Rows[k];
                OfertaNombre = filaMat["Nombre"].ToString();
                // Averigua si ya está en el resumen
                bExiste = false;
                iCab = -1;
                for (int i = 0; i < dtMatCab.Rows.Count; ++i)
                {
                    BaseNombre = dtMatCab.Rows[i][eMatCab.Nombre.ToString()].ToString();
                    if (OfertaNombre.Equals(BaseNombre))
                    {
                        bExiste = true;
                        iCab = i;
                        break;
                    }
                }
                // Si no existe lo incluye en la lista de cabecera
                if (!bExiste)
                {
                    DataRow filaMatCab = dtMatCab.NewRow();
                    iCab = dtMatCab.Rows.Count;
                    filaMatCab[eMatCab.Id.ToString()] = iCab;
                    filaMatCab[eMatCab.Nombre.ToString()] = OfertaNombre;
                    dtMatCab.Rows.Add(filaMatCab);
                }
                // Exista o no, lo incluye en la lista de detalle
                DataRow filaMatDet = dtMatDet.NewRow();
                filaMatDet[eMatDet.CabId.ToString()] = iCab;
                filaMatDet[eMatDet.MatId.ToString()] = k;
                filaMatDet[eMatDet.RubroCodigo.ToString()] = filaMat["RubroCodigo"].ToString();
                // Busca el nombre del rubro
                DataRow[] rubroEncontrado =
                    dtRubros.Select("Codigo = '" + filaMat["RubroCodigo"].ToString() + "'");
                if (rubroEncontrado.Length > 0)
                {
                    filaMatDet[eMatDet.RubroNombre.ToString()] = rubroEncontrado[0]["Nombre"];
                    filaMatDet[eMatDet.Costo.ToString()] = filaMat["Costo"];
                    filaMatDet[eMatDet.Transporte.ToString()] = filaMat["Transporte"];
                }

                // Inserta el detalle
                dtMatDet.Rows.Add(filaMatDet);
            }
        }
        //[+]------------------------------------------------------------------------------------- 
        public void getResumenEquipos()
        {
            String OfertaNombre;
            String BaseNombre;
            Boolean bExiste;
            int iCab;

            // Borro las tablas de cab y det
            int n = dtEquCab.Rows.Count;
            for (int i = 0; i < n; ++i)
                dtEquCab.Rows[0].Delete();

            // Se barre toda la mano de obra de la oferta
            for (int k = 0; k < dtEquipos.Rows.Count; ++k)
            {
                DataRow filaEqu = dtEquipos.Rows[k];
                OfertaNombre = filaEqu["Nombre"].ToString();
                // Averigua si ya está en el resumen
                bExiste = false;
                iCab = -1;
                for (int i = 0; i < dtEquCab.Rows.Count; ++i)
                {
                    BaseNombre = dtEquCab.Rows[i][eEquCab.Nombre.ToString()].ToString();
                    if (OfertaNombre.Equals(BaseNombre))
                    {
                        bExiste = true;
                        iCab = i;
                        break;
                    }
                }
                // Si no existe lo incluye en la lista de cabecera
                if (!bExiste)
                {
                    DataRow filaEquCab = dtEquCab.NewRow();
                    iCab = dtEquCab.Rows.Count;
                    filaEquCab[eEquCab.Id.ToString()] = iCab;
                    filaEquCab[eEquCab.Nombre.ToString()] = OfertaNombre;
                    dtEquCab.Rows.Add(filaEquCab);
                }
                // Exista o no, lo incluye en la lista de detalle
                DataRow filaEquDet = dtEquDet.NewRow();
                filaEquDet[eEquDet.CabId.ToString()] = iCab;
                filaEquDet[eEquDet.EquId.ToString()] = k;
                filaEquDet[eEquDet.RubroCodigo.ToString()] = filaEqu["RubroCodigo"].ToString();
                // Busca el nombre del rubro
                DataRow[] rubroEncontrado =
                    dtRubros.Select("Codigo = '" + filaEqu["RubroCodigo"].ToString() + "'");
                if (rubroEncontrado.Length > 0)
                {
                    filaEquDet[eEquDet.RubroNombre.ToString()] = rubroEncontrado[0]["Nombre"];
                    filaEquDet[eEquDet.Costo.ToString()] = filaEqu["Costo"];
                }

                // Inserta el detalle
                dtEquDet.Rows.Add(filaEquDet);
            }
        }
        //[+]-------------------------------------------------------------------------------------
        private void getDatosBaseMO(DataTable dtBaseMO)
        {
            CEL.APU.DO_Apu_Mano_Obra adp = new CEL.APU.DO_Apu_Mano_Obra();
            List<Apu_Mano_Obra> lstBaseMO = new List<Apu_Mano_Obra>();
            Scope s = new Scope();
            s.Int_Empresa_Id = "1";
            s.Int_Sucursal_Id = "1";
            s.Ver_Version_Id = "1";
            s.Int_Moneda_Id = "1";
            s.Per_Personal_Id = "00046012429099660";
            s.Int_Usuario_Id = "00019011965784103";

            lstBaseMO = adp.GetByEmpresa(s);
            foreach (Apu_Mano_Obra baseMO in lstBaseMO)
            {
                DataRow fila = dtBaseMO.NewRow();
                fila["BaseMOId"] = baseMO.Id;
                fila["BaseMONombre"] = baseMO.Nombre;
                dtBaseMO.Rows.Add(fila);
            }
        }
        //[+]------------------------------------------------------------------------------------- 
        public String GetOfertaByCodigoInst(String OfertaCodigo)
        {
            String OfertaNombre = "Oferta no encontrada";
            DO_Int_Subproyecto intSubproyecto = new DO_Int_Subproyecto();
            Scope s = new Scope();
            s.Int_Empresa_Id = "1";
            s.Int_Sucursal_Id = "1";
            s.Ver_Version_Id = "1";
            s.Int_Moneda_Id = "1";
            s.Per_Personal_Id = "00046012429099660";
            s.Int_Usuario_Id = "00019011965784103";
            List<Int_Subproyecto> lstSubproyecto 
                = intSubproyecto.GetByLikeCodigoInstitucional( s, OfertaCodigo + "%");
            if (lstSubproyecto.Count > 0)
            {
                OfertaNombre = lstSubproyecto[0].SPROY_NOMBRE;
            }
            return OfertaNombre;
        }
        //[+]------------------------------------------------------------------------------------- 
        public Scope ConstruyeScope(string usuario, string clave)
        {
            Scope s = new Scope();
            // Versión, empresa y moneda por defecto
            s.Ver_Version_Id = "1";
            s.Int_Empresa_Id = "1";
            s.Int_Moneda_Id = "1";
            // Verifica usuario y clave 
            CEL.INT.DO_Int_Usuario doUsuario = new CEL.INT.DO_Int_Usuario();
            List<AEL.INT.Int_Usuario> lstUsuario = doUsuario.GetByNombrePassword(s, usuario, clave);
            // Lanza error si el usuario no existe
            if (lstUsuario.Count == 0) throw new Exception("El usuario no es válido");
            // Llena el resto de datos del usuario
            s.Int_Usuario_Id = lstUsuario[0].Id;
            s.Int_Sucursal_Id = lstUsuario[0].Pred_Int_Sucursal_Id;
            s.Per_Personal_Id = lstUsuario[0].Per_Personal_Id;
            return s;
        }
        //[+]------------------------------------------------------------------------------------- 
        public Apu_Oferta CrearOfertaCab(Scope s, string OfertaNombre,
            decimal p_costo_indirecto, string OfertaOferente)
        {
            // Preparamos la cabecera de la oferta
            Apu_Oferta apu_oferta = new Apu_Oferta();
            apu_oferta.Nombre = OfertaNombre;
            apu_oferta.Apu_Lugar_Id = "00049013117902126";
            apu_oferta.Area = 1;
            apu_oferta.Porcentaje_Costo_Indirecto = p_costo_indirecto;
            apu_oferta.Porcentaje_Costo_Otros = 0;
            apu_oferta.Contratista = OfertaOferente;
            apu_oferta.Tecnico_Per_Personal_Id = s.Per_Personal_Id;
            apu_oferta.Etapa = "BOR";
            apu_oferta.Tipo_Contrato = "PRI";
            apu_oferta.Int_Sucursal_Id = s.Int_Sucursal_Id;
            apu_oferta.Int_Moneda_Id = s.Int_Moneda_Id;
            return apu_oferta;
        }
        //[+]------------------------------------------------------------------------------------- 
        // Clases para manejar los rubros y sus insumos en el proceso de carga
        #region
        public class xOferta
        {
            public Scope s = new Scope();
            public Apu_Oferta oferta = new Apu_Oferta();
            public List<xRubro> lstRubros = new List<xRubro>();
            public xOferta() { ; }
        }
        public class xRubro 
        {
            public Apu_Oferta_Rubro ofertaRubro = new Apu_Oferta_Rubro();
            public List<xMAN> lstMAN = new List<xMAN>();
            public List<xMAT> lstMAT = new List<xMAT>();
            public List<xEQU> lstEQU = new List<xEQU>();
            public xRubro() { ; }
        }
        public class xMAN
        {
            public Apu_Oferta_Rubro_Mano_Obra OfertaRubroMAN = new Apu_Oferta_Rubro_Mano_Obra();
            public xMAN() { ; }
        }
        public class xMAT
        {
            public Apu_Oferta_Rubro_Material OfertaRubroMAT = new Apu_Oferta_Rubro_Material();
            public xMAT() { ; }
        }
        public class xEQU
        {
            public Apu_Oferta_Rubro_Equipo OfertaRubroEQU = new Apu_Oferta_Rubro_Equipo();
            public xEQU() { ; }
        }
        #endregion
        //[+]------------------------------------------------------------------------------------- 
        public xOferta prepararOferta(string usuario, string clave, 
            string OfertaNombre, decimal p_costo_indirecto,
            string OfertaOferente)
        {
            xOferta preOferta = new xOferta();
            // Prepara la cabecera
            preOferta.s = ConstruyeScope(usuario, clave);
            preOferta.oferta = CrearOfertaCab(preOferta.s, OfertaNombre, p_costo_indirecto, OfertaOferente);
            // Prepara los rubros y sus insumos
            foreach (DataRow drRubro in dtRubros.Rows)
            {
                xRubro preRubro = new xRubro();
                preOferta.lstRubros.Add(preRubro);
                // el rubro
                preRubro.ofertaRubro.Apu_Rubro_Nombre = (String)drRubro[eRubros.Nombre.ToString()];
                preRubro.ofertaRubro.Apu_Rubro_Unidad = (String)drRubro[eRubros.Unidad.ToString()];
                preRubro.ofertaRubro.Cantidad = (Decimal)drRubro[eRubros.Cantidad.ToString()];
                // sus equipos
                DataRow[] resRubroEquipos = dtEquipos.Select(
                    eEquipos.RubroCodigo.ToString() 
                    + " = '"
                    + drRubro[eRubros.Codigo.ToString()]
                    + "'"
                    );
                foreach (DataRow drEquipo in resRubroEquipos)
                {
                    xEQU preEQU = new xEQU();
                    preEQU.OfertaRubroEQU.Apu_Equipo_Nombre = (String)drEquipo[eEquipos.Nombre.ToString()];
                    preEQU.OfertaRubroEQU.Costo = (Decimal) drEquipo[eEquipos.Costo.ToString()];
                    preRubro.lstEQU.Add(preEQU);
                }
                // sus materiales
                DataRow[] resRubroMateriales = dtMateriales.Select(
                    eMateriales.RubroCodigo.ToString()
                    + " = '"
                    + drRubro[eRubros.Codigo.ToString()]
                    + "'"
                    );
                foreach (DataRow drMaterial in resRubroMateriales)
                {
                    xMAT preMAT = new xMAT();
                    preMAT.OfertaRubroMAT.Apu_Material_Nombre = (String)drMaterial[eMateriales.Nombre.ToString()];
                    preMAT.OfertaRubroMAT.Apu_Material_Unidad = "U.";
                    preMAT.OfertaRubroMAT.Costo = (Decimal) drMaterial[eMateriales.Costo.ToString()];
                    if ((drMaterial[eMateriales.Transporte.ToString()].ToString()).Equals(""))
                        preMAT.OfertaRubroMAT.Costo_Transporte = 0;
                    else
                        preMAT.OfertaRubroMAT.Costo_Transporte = (Decimal) drMaterial[eMateriales.Transporte.ToString()];
                    preRubro.lstMAT.Add(preMAT);
                }
                // sus manos de obras
                DataRow[] resRubroManoObra = dtManDet.Select(
                    eManDet.RubroCodigo.ToString()
                    + " = '"
                    + drRubro[eRubros.Codigo.ToString()]
                    + "'"
                    );
                foreach (DataRow drManoObra in resRubroManoObra)
                {
                    xMAN preMAN = new xMAN();
                    DataRow[] resManCab = dtManCab.Select(
                        eManCab.Id.ToString() 
                        + " = '"
                        + drManoObra[eManDet.CabId.ToString()]
                        + "'"
                        );
                    preMAN.OfertaRubroMAN.Apu_Mano_Obra_Id = (String)resManCab[0][eManCab.BaseId.ToString()];
                    preMAN.OfertaRubroMAN.Apu_Mano_Obra_Nombre = (String)resManCab[0][eManCab.BaseNombre.ToString()];
                    preMAN.OfertaRubroMAN.Costo = (Decimal) drManoObra[eManoObras.Costo.ToString()];
                    preRubro.lstMAN.Add(preMAN);
                }
            }
            // Retorna un mensaje con el resultado
            return preOferta;
        }
        //[+]------------------------------------------------------------------------------------- 
        public String grabarOferta(xOferta preOferta)
        {
            String ofertaId;   
            Scope s = preOferta.s;
            // grabar la cabecera
            ofertaId = DEL.APU.DO_Apu_Oferta.Insert(preOferta.s,preOferta.oferta);
            // grabar los rubros y sus insumos
            foreach (xRubro preRubro in preOferta.lstRubros)
            {
                String OfertaRubroId;
                preRubro.ofertaRubro.Apu_Oferta_Id = ofertaId;
                // Busca un rubro con el mismo nombre
                CEL.APU.DO_Apu_Rubro adpRubro = new CEL.APU.DO_Apu_Rubro();
                List<Apu_Rubro> resRubroIgualNombre = 
                    adpRubro.GetByNombre(s, preRubro.ofertaRubro.Apu_Rubro_Nombre, s.Int_Sucursal_Id);
                if (resRubroIgualNombre.Count > 0)
                    preRubro.ofertaRubro.Apu_Rubro_Id = resRubroIgualNombre[0].Id;
                // Inserta el rubro en la oferta
                OfertaRubroId = DEL.APU.DO_Apu_Oferta_Rubro.Insert(s, preRubro.ofertaRubro);
                // Equipos 
                foreach (xEQU preEQU in preRubro.lstEQU)
                {
                    try
                    {
                        String OfertaEquId;
                        String EquId;
                        Apu_Equipo apuEquipo = new Apu_Equipo();
                        // Crear el equipo antes de incluirlo en la oferta
                        apuEquipo.Nombre = preEQU.OfertaRubroEQU.Apu_Equipo_Nombre;
                        apuEquipo.Disponible = "N";
                        EquId = DEL.APU.DO_Apu_Equipo.Insert(s, apuEquipo);
                        // Insertar el equipo en el rubro de la oferta
                        preEQU.OfertaRubroEQU.Apu_Oferta_Id = ofertaId;
                        preEQU.OfertaRubroEQU.Apu_Oferta_Rubro_Id = OfertaRubroId;
                        preEQU.OfertaRubroEQU.Apu_Equipo_Id = EquId;
                        OfertaEquId = DEL.APU.DO_Apu_Oferta_Rubro_Equipo.Insert(s, preEQU.OfertaRubroEQU);
                    }
                    catch (Exception ex)
                    {
                        String msj = ex.Message + "(Equipo: "
                            + preEQU.OfertaRubroEQU.Apu_Equipo_Nombre
                            + " del rubro ;"
                            + preRubro.ofertaRubro.Apu_Rubro_Nombre
                            + ") ";
                        throw (new Exception(msj));
                    }
                }
                // Materiales
                foreach (xMAT preMAT in preRubro.lstMAT)
                {
                    try
                    {
                        String OfertaMatId;
                        String MatId;
                        Apu_Material apuMaterial = new Apu_Material();
                        // Crear el material antes de incluirlo en la oferta
                        apuMaterial.Nombre = preMAT.OfertaRubroMAT.Apu_Material_Nombre;
                        apuMaterial.Unidad = preMAT.OfertaRubroMAT.Apu_Material_Unidad;
                        apuMaterial.Disponible = "N";
                        MatId = DEL.APU.DO_Apu_Material.Insert(s, apuMaterial);
                        // Insertar el material en el rubro de la oferta
                        preMAT.OfertaRubroMAT.Apu_Oferta_Id = ofertaId;
                        preMAT.OfertaRubroMAT.Apu_Oferta_Rubro_Id = OfertaRubroId;
                        preMAT.OfertaRubroMAT.Apu_Material_Id = MatId;
                        OfertaMatId = DEL.APU.DO_Apu_Oferta_Rubro_Material.Insert(s, preMAT.OfertaRubroMAT);
                    }
                    catch (Exception ex)
                    {
                        String msj = ex.Message + "(Material: "
                            + preMAT.OfertaRubroMAT.Apu_Material_Nombre
                            + " del rubro ;"
                            + preRubro.ofertaRubro.Apu_Rubro_Nombre
                            + ") ";
                        throw (new Exception(msj));
                    }
                }
                // Mano de obra
                foreach (xMAN preMAN in preRubro.lstMAN)
                {
                    try
                    {
                        String OfertaManId;
                        preMAN.OfertaRubroMAN.Apu_Oferta_Id = ofertaId;
                        preMAN.OfertaRubroMAN.Apu_Oferta_Rubro_Id = OfertaRubroId;
                        OfertaManId = DEL.APU.DO_Apu_Oferta_Rubro_Mano_Obra.Insert(s, preMAN.OfertaRubroMAN);
                    }
                    catch (Exception ex)
                    {
                        String msj = ex.Message + "(Mano de Obra: "
                            + preMAN.OfertaRubroMAN.Apu_Mano_Obra_Nombre
                            + " del rubro ;"
                            + preRubro.ofertaRubro.Apu_Rubro_Nombre
                            + ") ";
                        throw (new Exception(msj));
                    }                    
                }
            }
            return "Proyecto creado con código: " + preOferta.oferta.Codigo;
        }
        //[+]------------------------------------------------------------------------------------- 
        public String grabarArchivoXML() 
        {
            try
            {
                string path="APU_Oferta.xml";
                SaveFileDialog file = new SaveFileDialog();
                if (file.ShowDialog() == DialogResult.OK)
                {
                    DialogResult respuesta =
                        MessageBox.Show(
                            "Al escribir los datos al archivo, se perderán los datos anteriores. Desea continuar?",
                            "Advertencia",
                            MessageBoxButtons.YesNo);
                    if (respuesta.Equals(DialogResult.Yes))
                    {
                        path = file.FileName;
                        ds.WriteXml(path);
                    }
                }
            }
            catch (Exception exc)
            {
                MessageBox.Show("Error: "+exc.Message,"Error al leer el archivo XML");
            }
            
            return "";
        }
        //[+]------------------------------------------------------------------------------------- 
        public String leerArchivoXML()
        {
            try
            {
                string path="APU_Oferta.xml";
                OpenFileDialog file = new OpenFileDialog();
                if (file.ShowDialog() == DialogResult.OK)
                {
                    DialogResult respuesta =
                        MessageBox.Show(
                        "Al cargar los datos desde el archivo, se perderán los datos de pantalla. Desea continuar?",
                        "Advertencia",
                        MessageBoxButtons.YesNo);
                    if (respuesta.Equals(DialogResult.Yes))
                    {
                        path = file.FileName;
                        limpiarOferta();
                        ds.ReadXml(path);
                    }
                }   
            }
            catch (Exception exc)
            {
                MessageBox.Show("Error: " + exc.Message, "Error al escribir el archivo XML");
            }
            
            return "";
        }
        //[+]------------------------------------------------------------------------------------- 
        public String limpiarOferta()
        {
            while (dtManDet.Rows.Count > 0)
                dtManDet.Rows[0].Delete();
            while (dtManCab.Rows.Count > 0)
                dtManCab.Rows[0].Delete();

            while (dtMatDet.Rows.Count > 0)
                dtMatDet.Rows[0].Delete();
            while (dtMatCab.Rows.Count > 0)
                dtMatCab.Rows[0].Delete();

            while (dtEquDet.Rows.Count > 0)
                dtEquDet.Rows[0].Delete();
            while (dtEquCab.Rows.Count > 0)
                dtEquCab.Rows[0].Delete();

            while (dtMateriales.Rows.Count > 0)
                dtMateriales.Rows[0].Delete();
            while (dtManoObras.Rows.Count > 0)
                dtManoObras.Rows[0].Delete();
            while (dtEquipos.Rows.Count > 0)
                dtEquipos.Rows[0].Delete();
            while (dtRubros.Rows.Count > 0)
                dtRubros.Rows[0].Delete();

            return "";
        }
        //[+]------------------------------------------------------------------------------------- 
    }
}
